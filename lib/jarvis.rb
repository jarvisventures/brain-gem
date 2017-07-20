require 'active_record' unless defined? ActiveRecord
require "jarvis/version"
require 'ancestry'
require 'jarvis/models/is_brain_user'

module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
      end
    end
    module LocalInstanceMethods
      def output
        puts "I hope this works"
      end
    end
  end
end


ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    def self.is_brain_user
      include Jarvis::IsBrainUser
    end
  end
end
