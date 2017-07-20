module Jarvis
  module ActiveRecord
    module Base
      def self.is_brain_user
        include Jarvis
        include Ancestry
        has_ancestry

        def output
          puts "wouldn't it be cool if this works"
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
          body = build_body
          url = ENV["BRAIN_URL"] + 'users'
          HTTParty.public_send('post', url, body: self.to_json)
        end

        # after an update we will put the changes to the brain
        after_update do
          body = build_body
          url = ENV["BRAIN_URL"] + 'users'
          HTTParty.public_send('put', url, body: body )
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Jarvis::ActiveRecord::Base
end
