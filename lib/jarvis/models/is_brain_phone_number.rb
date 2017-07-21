module Jarvis
  module IsBrainPhoneNumber
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_phone_number
        include Jarvis::IsBrainPhoneNumber::LocalInstanceMethods
        belongs_to :user, optional: true
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/phone_number"
          body = self.jarvis_phone_number_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:phone_number][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/phone_number"
          body = self.jarvis_phone_number_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/phone_number"
          body = self.jarvis_phone_number_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_phone_number_serializer
        hash = self.attributes
        hash[:user] = !self.user.blank? ? self.user.to_json : {}
        return_hash = {phone_number: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainPhoneNumber
end
