require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift(File.join(Gem::Specification.find_by_name("refile").gem_dir, "spec"))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require "refile/spec_helper"
require "mongo"
require "pry"
require "refile/gridfs"

WebMock.disable!(:except => [:codeclimate_test_reporter])

RSpec.configure do |_config|
end
