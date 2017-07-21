module Jarvis
  module IsBrainTag
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_tag
        include Jarvis::IsBrainTag::LocalInstanceMethods
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/tag"
          body = self.jarvis_tag_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:tag][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/tag"
          body = self.jarvis_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/tag"
          body = self.jarvis_tag_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_tag_serializer
        hash = self.attributes
        return_hash = {tag: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainTag
end
