module Jarvis
  module IsBrainDepartment
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_department
        include Jarvis::IsBrainDepartment::LocalInstanceMethods
        belongs_to :company, optional: true
        has_many :users
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/department"
          body = self.jarvis_department_serializer
          results = HTTParty.public_send(method, url, body: body).deep_symbolize_keys
          self.update(brain_token: results[:department][:brain_token])
        end
        after_update do
          method = "put"
          url = ENV["BRAIN_URL"] + "/department"
          body = self.jarvis_department_serializer
          HTTParty.public_send(method, url, body: body)
        end
        after_destroy do
          method = "delete"
          url = ENV["BRAIN_URL"] + "/department"
          body = self.jarvis_department_serializer
          HTTParty.public_send(method, url, body: body)
        end
      end
    end
    module LocalInstanceMethods
      def jarvis_department_serializer
        hash = self.attributes
        hash[:company] = !self.company.blank? ? self.company.to_json : {}
        return_hash = {department: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainDepartment
end
