require 'serializers/user_serializer'
module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/user"
          body = UserSerializer.new(self)
          HTTParty.public_send(method, url, body: body)
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
