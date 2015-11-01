require "mongo"
require "refile/backend_macros"

module Refile
  module Gridfs
    class Backend
      extend Refile::BackendMacros

      DEFAULT_PREFIX = "fs"
      INIT_CONNECTION_ARG_ERROR_MSG = "When initializing new Refile::Gridfs::Backend first argument should be an instance of Mongo::Client or a lambda/proc that returns it. When using Mongoid it is available as Mongoid.client(:default)"

      attr_reader :max_size, :prefix, :hasher

      def initialize(connection_or_proc, max_size: nil, prefix: DEFAULT_PREFIX, hasher: Refile::RandomHasher.new)
        @connection_or_proc = connection_or_proc
        @max_size   = max_size
        @prefix     = prefix
        @hasher     = hasher
      end

      verify_uploadable def upload(uploadable)
        filename = @hasher.hash(uploadable)

        file = Mongo::Grid::File.new(uploadable.read, filename: filename)
        gridfs.insert_one(file)

        Refile::File.new(self, filename)
      end

      verify_id def get(id)
        Refile::File.new(self, id)
      end

      verify_id def delete(id)
        file = gridfs.find_one(filename: id)
        gridfs.delete_one(file) if file
      end

      verify_id def open(id)
        StringIO.new(read(id))
      end

      verify_id def read(id)
        if exists?(id)
          gridfs.find_one(filename: id).data
        else
          nil
        end
      end

      verify_id def size(id)
        file = gridfs.find_one(filename: id)
        file.data.length if file
      end

      verify_id def exists?(id)
        !! gridfs.find_one(filename: id)
      end

      def clear!(confirm = nil)
        raise Refile::Confirm unless confirm == :confirm

        connection["#{@prefix}.files"].drop
        connection["#{@prefix}.chunks"].drop
      end

    private

      def obtain_new_connection
        candidate = @connection_or_proc.is_a?(Proc) ? @connection_or_proc.call : @connection_or_proc
        unless candidate.is_a?(Mongo::Client)
          raise ArgumentError.new(INIT_CONNECTION_ARG_ERROR_MSG)
        end
        @connection = candidate
      end

      def connection
        @connection || obtain_new_connection
      end

      def gridfs
        connection.database.fs(fs_name: @prefix)
      end
    end
  end
end
