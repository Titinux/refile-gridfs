require "spec_helper"

RSpec.describe Refile::Gridfs::Backend do
  let(:connection_or_proc) { Mongo::Client.new('mongodb://127.0.0.1:27017/refile_test') }
  let(:backend) { Refile::Gridfs::Backend.new(connection_or_proc, max_size: 100) }
  it_behaves_like :backend
end
