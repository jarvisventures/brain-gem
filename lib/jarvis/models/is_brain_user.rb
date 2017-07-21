# require 'serializers/user_serializer'
module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
        belongs_to :company
        belongs_to :department
        belongs_to :division
        belongs_to :location
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/user"
          body = self.jarvis_user_serializer
          results = HTTParty.public_send(method, url, body: body)
          self.brain_token = results[:user][:brain_token]
        end
      end
    end
    module LocalInstanceMethods
      def output
        puts "I hope this works"
      end
      def jarvis_user_serializer
        hash = self.to_json
        unless self.company.blank? ? hash.merge(company: self.company.to_json) : hash.merge(company: {})
        unless self.department.blank? ? hash.merge(department: self.department.to_json) : hash.merge(department: {})
        unless self.division.blank? ? hash.merge(division: self.division.to_json) : hash.merge(division: {})
        unless self.location.blank? ? hash.merge(location: self.location.to_json) : hash.merge(location: {})
        return hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainUser
end
