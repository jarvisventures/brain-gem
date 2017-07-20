module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
        after_create do
          puts "created on the brain"
        end
      end
    end
    module LocalInstanceMethods
      def output
        puts "I hope this works"
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainUser
end
