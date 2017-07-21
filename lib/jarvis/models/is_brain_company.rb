module Jarvis
  module IsBrainCompany
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_company
        include Jarvis::IsBrainCompany::LocalInstanceMethods
        has_many :users
        has_many :departments
        has_many :divisions
        has_many :locations
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/company"
          body = self.jarvis_company_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:company][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/company"
          body = self.jarvis_company_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/company"
          body = self.jarvis_company_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_company_serializer
        hash = self.attributes
        return_hash = {company: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainCompany
end
