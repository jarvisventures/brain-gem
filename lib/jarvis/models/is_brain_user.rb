module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
        after_create do
          method =  "post"
          url = "http://" + ENV["BRAIN_URL"] + "/user"
          body = self.to_json
          headers = nil
          results = HTTParty.public_send(method,url, body: body, headers: headers)
          self.brain_token = results.brain_token
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
