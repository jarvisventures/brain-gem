require 'active_record' unless defined? ActiveRecord
require "jarvis/version"
require 'ancestry'

module Jarvis
  class Engine < ::Rails::Engine
  end
end

ActiveSupport.on_load(:active_record) do
  class ActiveRecord::Base
    def self.has_jarvis
      include Jarvis
      include Ancestry
      has_ancestry

      def push_to_jarvis
        puts "pushed to jarvis"
      end
      
      # def company_token=(val)
      #   company = Company.find_by(token: val)
      #   company = Company.create()
      #   write_attribute(:company_id, company.id)
      # end
      #
      # def division_token=(val)
      #   division = Division.find_by(token: val)
      #
      #   write_attribute(:division_id, division.id)
      # end
      #
      # def department_token=(val)
      #   department = Department.find_by(token: val)
      #   write_attribute(:department_id, department.id)
      # end
      #
      # def supervisor_token=(val)
      #   user = User.find_by(jarvis_token: val)
      #   self.parent = user
      # end

      # after create we are going to post the new user to the brain
      after_create do
        puts "created"
      end

      # after an update we will put the changes to the brain
      after_update do
        puts "updated"
      end
    end
  end
end
