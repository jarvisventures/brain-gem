require 'active_record' unless defined? ActiveRecord
require "jarvis/version"

module Jarvis
  class Engine < ::Rails::Engine
  end
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    def self.has_jarvis
      include Jarvis

      # after create we are going to post the new user to the brain
      after_create do
        puts "created"
      end

      # after an update we will put the changes to the brain
      after_update do
        puts "updated"
      end

    end
  end
end
