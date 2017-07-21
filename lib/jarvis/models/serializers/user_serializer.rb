module Jarvis
  module Serializers
    class UserSerializer < ActiveModel::Serializer
      attributes :password_digest, :brain_token, :first_name, :last_name, :address_1, :address_2, :city, :state, :country, :zipcode, :age, :date_of_birth, :ethnicity, :gender, :marital_status, :active,
      :hr_software_id, :employee_number, :supervisor_id, :hire_date, :rehire_date, :termination_date, :ancestry, :last_changed
      has_one :division
      has_one :department
      has_one :company
      has_one :location
      has_many :emails
      has_many :phone_numbers
      has_many :tags
      has_one :parent
    end
  end
end
