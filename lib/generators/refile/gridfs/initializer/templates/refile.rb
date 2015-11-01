require "refile"

Refile.configure do |config|
  config.store = Refile::Gridfs::Backend.new(proc { Mongo::Client.new('mongodb://127.0.0.1:27017/my_db') } )
end
