module Jarvis
  module IsBrainUserTag
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user_tag
        include Jarvis::IsBrainUserTag::LocalInstanceMethods
        belongs_to :user, optional: true
        belongs_to :tag, optional: true
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/user_tag"
          body = self.jarvis_user_tag_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:user_tag][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/user_tag"
          body = self.jarvis_user_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/user_tag"
          body = self.jarvis_user_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_user_tag_serializer
        hash = self.attributes
        hash[:user] = !self.user.blank? ? self.user.to_json : {}
        hash[:tag] = !self.tag.blank? ? self.tag.to_json : {}
        return_hash = {user_tag: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainUserTag
end
