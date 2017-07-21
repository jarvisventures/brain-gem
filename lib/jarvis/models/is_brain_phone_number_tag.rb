module Jarvis
  module IsBrainPhoneNumberTag
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_phone_number_tag
        include Jarvis::IsBrainPhoneNumberTag::LocalInstanceMethods
        belongs_to :phone_number, optional: true
        belongs_to :tag, optional: true
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/phone_number_tag"
          body = self.jarvis_phone_number_tag_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:phone_number_tag][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/phone_number_tag"
          body = self.jarvis_phone_number_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/phone_number_tag"
          body = self.jarvis_phone_number_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_phone_number_tag_serializer
        hash = self.attributes
        hash[:phone_number] = !self.phone_number.blank? ? self.phone_number.to_json : {}
        hash[:tag] = !self.tag.blank? ? self.tag.to_json : {}
        return_hash = {phone_number_tag: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainPhoneNumberTag
end
