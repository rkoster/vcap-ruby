require 'spec_helper'
require 'cfruntime/properties'

describe 'CFRuntime::MongoParser' do
  it 'parses a mongo service' do
    svcs = {
      "mongodb-#{mongo_version}" => [create_mongo_service('mongo-test')]
    }
    with_vcap_services(svcs) do
      expected = { :label => "mongodb",
        :version => "#{mongo_version}",
        :name => "mongo-test",
        :username => "testuser",
        :password => "testpw",
        :host => SOME_SERVER,
        :port => SOME_SERVICE_PORT,
        :db => "db"
      }
      CFRuntime::CloudApp.service_props('mongodb').should == expected
    end
  end
end