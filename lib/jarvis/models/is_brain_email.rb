module Jarvis
  module IsBrainEmail
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_email
        include Jarvis::IsBrainEmail::LocalInstanceMethods
        belongs_to :user, optional: true
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/email"
          body = self.jarvis_email_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:email][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/email"
          body = self.jarvis_email_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/email"
          body = self.jarvis_email_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_email_serializer
        hash = self.attributes
        hash[:user] = !self.user.blank? ? self.user.to_json : {}
        return_hash = {email: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainEmail
end
