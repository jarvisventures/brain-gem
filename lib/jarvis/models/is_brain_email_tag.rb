module Jarvis
  module IsBrainEmailTag
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_email_tag
        include Jarvis::IsBrainEmailTag::LocalInstanceMethods
        belongs_to :email, optional: true
        belongs_to :tag, optional: true
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/email_tag"
          body = self.jarvis_email_tag_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:email_tag][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/email_tag"
          body = self.jarvis_email_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/email_tag"
          body = self.jarvis_email_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_email_tag_serializer
        hash = self.attributes
        hash[:email] = !self.email.blank? ? self.email.to_json : {}
        hash[:tag] = !self.tag.blank? ? self.tag.to_json : {}
        return_hash = {email_tag: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainEmailTag
end
