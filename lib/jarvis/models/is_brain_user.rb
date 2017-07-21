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
        hash = self.to_json
        unless self.company.blank?
          hash[:company] = self.company.to_json
        else
          hash[:company] = {}
        end
        # hash[:department] = !self.department.blank? ? self.department.to_json : {}
        # hash[:division] = !self.division.blank? ? self.division.to_json : {}
        # hash[:location] = !self.location.blank? ? self.location.to_json : {}
        return hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainUser
end
