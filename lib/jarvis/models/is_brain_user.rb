# require 'serializers/user_serializer'
module Jarvis
  module IsBrainUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_brain_user
        include Jarvis::IsBrainUser::LocalInstanceMethods
        belongs_to :company, optional: true
        belongs_to :department, optional: true
        belongs_to :division, optional: true
        belongs_to :location, optional: true
        has_ancestry
        after_create do
          method = "post"
          url = ENV["BRAIN_URL"] + "/user"
          body = self.jarvis_user_serializer
          results = HTTParty.public_send(method, url, body: body).symbolize_keys
          debugger
          self.update(brain_token: results[:user][:brain_token])
        end
      end
    end
    module LocalInstanceMethods
      def output
        puts "I hope this works"
      end
      def jarvis_user_serializer
        hash = self.attributes
        hash[:company] = !self.company.blank? ? self.company.to_json : {}
        hash[:department] = !self.department.blank? ? self.department.to_json : {}
        hash[:division] = !self.division.blank? ? self.division.to_json : {}
        hash[:location] = !self.location.blank? ? self.location.to_json : {}
        return_hash = {user: hash}
        return return_hash
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::IsBrainUser
end
