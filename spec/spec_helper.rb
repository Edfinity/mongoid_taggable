$: << File.expand_path("../../lib", __FILE__)

require 'database_cleaner'
require 'pry'


module Mongo
  class Collection
    class View
      def remove_all
        remove(0)
      end
    end
  end
end

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

require 'mongoid'
require 'mongoid_taggable'

Mongoid.load!("spec/mongoid.yml", :test)
