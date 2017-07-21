module Jarvis
  module IsBrainLocation
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_location
        include Jarvis::IsBrainLocation::LocalInstanceMethods
        belongs_to :company, optional: true
        has_many :users
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/location"
          body = self.jarvis_location_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:location][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/location"
          body = self.jarvis_location_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/location"
          body = self.jarvis_location_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_location_serializer
        hash = self.attributes
        hash[:company] = !self.company.blank? ? self.company.to_json : {}
        return_hash = {location: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainLocation
end
