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

class ActiveRecord::Base
  include Jarvis::IsBrainUser
end
