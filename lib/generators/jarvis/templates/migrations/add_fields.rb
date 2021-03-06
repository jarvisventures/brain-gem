class AddFields < ActiveRecord::Migration<%= Rails::VERSION::MAJOR >= 5 ? "[#{Rails.version.to_f}]" : "" %>
  def change
    # create table for the users if it doesn't exist
    create_table(:companies) unless table_exists?(:companies)
    create_table(:divisions) unless table_exists?(:divisions)
    create_table(:departments) unless table_exists?(:departments)
    create_table(:locations) unless table_exists?(:locations)
    create_table(:users) unless table_exists?(:users)
    create_table(:tags) unless table_exists?(:tags)
    create_table(:user_tags) unless table_exists?(:user_tags)
    create_table(:emails) unless table_exists?(:emails)
    create_table(:phone_numbers) unless table_exists?(:phone_numbers)
    create_table(:email_tags) unless table_exists?(:email_tags)
    create_table(:phone_number_tags) unless table_exists?(:phone_number_tags)
    # add all of the company properties
    add_column(:companies, :name, :string) unless column_exists?(:companies, :name)
    add_column(:companies, :active, :boolean) unless column_exists?(:companies, :active)
    add_column(:companies, :brain_token, :string) unless column_exists?(:companies, :brain_token)
    add_index(:companies, :brain_token, unique: true) unless index_exists?(:companies, :brain_token)
    add_column(:companies, :subdomain, :string) unless column_exists?(:companies, :subdomain)
    add_column(:companies, :logos, :string) unless column_exists?(:companies, :logos)
    # add all of the divisions properties
    add_column(:divisions, :name, :string) unless column_exists?(:divisions, :name)
    add_reference(:divisions, :company, foreign_key: true) unless column_exists?(:divisions, :company_id)
    add_column(:divisions, :brain_token, :string) unless column_exists?(:divisions, :brain_token)
    add_index(:divisions, :brain_token, unique: true) unless index_exists?(:divisions, :brain_token)
    add_column(:divisions, :ancestry, :string) unless column_exists?(:divisions, :ancestry)
    # add all of the departments properties
    add_column(:departments, :name, :string) unless column_exists?(:departments, :name)
    add_reference(:departments, :company, foreign_key: true) unless column_exists?(:departments, :company_id)
    add_column(:departments, :brain_token, :string) unless column_exists?(:departments, :brain_token)
    add_index(:departments, :brain_token, unique: true) unless index_exists?(:departments, :brain_token)
    add_column(:departments, :ancestry, :string) unless column_exists?(:departments, :ancestry)
    # add all of the locations properties
    add_column(:locations, :name, :string) unless column_exists?(:locations, :name)
    add_column(:locations, :address_1, :string) unless column_exists?(:locations, :address_1)
    add_column(:locations, :address_2, :string) unless column_exists?(:locations, :address_2)
    add_column(:locations, :city, :string) unless column_exists?(:locations, :city)
    add_column(:locations, :state, :string) unless column_exists?(:locations, :state)
    add_column(:locations, :country, :string) unless column_exists?(:locations, :country)
    add_column(:locations, :zipcode, :string) unless column_exists?(:locations, :zipcode)
    add_reference(:locations, :company, foreign_key: true) unless column_exists?(:locations, :company_id)
    add_column(:locations, :brain_token, :string) unless column_exists?(:locations, :brain_token)
    add_index(:locations, :brain_token, unique: true) unless index_exists?(:locations, :brain_token)
    add_column(:locations, :ancestry, :string) unless column_exists?(:locations, :ancestry)
    #add all of the tags properties
    add_column(:tags, :tag, :string) unless column_exists?(:tags, :tag)
    add_column(:tags, :brain_token, :string) unless column_exists?(:tags, :brain_token)
    add_index(:tags, :brain_token, unique: true) unless index_exists?(:tags, :brain_token)
    # add all of the user properties
    add_reference(:users, :company, foreign_key: true) unless column_exists?(:users, :company_id)
    add_reference(:users, :division, foreign_key: true) unless column_exists?(:users, :division_id)
    add_reference(:users, :department, foreign_key: true) unless column_exists?(:users, :department_id)
    add_reference(:users, :location, foreign_key: true) unless column_exists?(:users, :location_id)
    add_column(:users, :first_name, :string) unless column_exists?(:users, :first_name)
    add_column(:users, :last_name, :string) unless column_exists?(:users, :last_name)
    add_column(:users, :address_1, :string) unless column_exists?(:users, :address_1)
    add_column(:users, :address_2, :string) unless column_exists?(:users, :address_2)
    add_column(:users, :city, :string) unless column_exists?(:users, :city)
    add_column(:users, :state, :string) unless column_exists?(:users, :state)
    add_column(:users, :country, :string) unless column_exists?(:users, :country)
    add_column(:users, :zipcode, :string) unless column_exists?(:users, :zipcode)
    add_column(:users, :age, :integer) unless column_exists?(:users, :age)
    add_column(:users, :date_of_birth, :date) unless column_exists?(:users, :date_of_birth)
    add_column(:users, :ethnicity, :string) unless column_exists?(:users, :ethnicity)
    add_column(:users, :gender, :string) unless column_exists?(:users, :gender)
    add_column(:users, :marital_status, :string) unless column_exists?(:users, :marital_status)
    add_column(:users, :active, :boolean) unless column_exists?(:users, :active)
    add_column(:users, :employee_number, :string) unless column_exists?(:users, :employee_number)
    add_column(:users, :hire_date, :date) unless column_exists?(:users, :hire_date)
    add_column(:users, :termination_date, :date) unless column_exists?(:users, :termination_date)
    add_column(:users, :ancestry, :string) unless column_exists?(:users, :ancestry)
    add_column(:users, :last_changed, :datetime) unless column_exists?(:users, :last_changed)
    add_column(:users, :employee_number, :string) unless column_exists?(:users, :employee_number)
    add_column(:users, :brain_token, :string) unless column_exists?(:users, :brain_token)
    add_index(:users, :brain_token, unique: true) unless index_exists?(:users, :brain_token)
    # add all of the email properties
    add_column(:emails, :email, :string) unless column_exists?(:emails, :email)
    add_column(:emails, :brain_token, :string) unless column_exists?(:emails, :brain_token)
    add_index(:emails, :brain_token, unique: true) unless index_exists?(:emails, :brain_token)
    add_reference(:emails, :user, foreign_key: true) unless column_exists?(:emails, :user_id)
    # add all of the phone number properties
    add_column(:phone_numbers, :phone_number, :string) unless column_exists?(:phone_numbers, :phone_number)
    add_column(:phone_numbers, :brain_token, :string) unless column_exists?(:phone_numbers, :brain_token)
    add_index(:phone_numbers, :brain_token, unique: true) unless index_exists?(:phone_numbers, :brain_token)
    add_reference(:phone_numbers, :user, foreign_key: true) unless column_exists?(:phone_numbers, :user_id)
    #add all of user_tag properties
    add_reference(:user_tags, :user, foreign_key: true) unless column_exists?(:user_tags, :user_id)
    add_reference(:user_tags, :tag, foreign_key: true) unless column_exists?(:user_tags, :tag_id)
    add_column(:user_tags, :brain_token, :string) unless column_exists?(:user_tags, :brain_token)
    add_index(:user_tags, :brain_token, unique: true) unless index_exists?(:user_tags, :brain_token)
    #add all of email_tag properties
    add_reference(:email_tags, :email, foreign_key: true) unless column_exists?(:email_tags, :email_id)
    add_reference(:email_tags, :tag, foreign_key: true) unless column_exists?(:email_tags, :tag_id)
    add_column(:email_tags, :brain_token, :string) unless column_exists?(:email_tags, :brain_token)
    add_index(:email_tags, :brain_token, unique: true) unless index_exists?(:email_tags, :brain_token)
    #add all of phone_number_tag properties
    add_reference(:phone_number_tags, :phone_number, foreign_key: true) unless column_exists?(:phone_number_tags, :phone_number_id)
    add_reference(:phone_number_tags, :tag, foreign_key: true) unless column_exists?(:phone_number_tags, :tag_id)
    add_column(:phone_number_tags, :brain_token, :string) unless column_exists?(:phone_number_tags, :brain_token)
    add_index(:phone_number_tags, :brain_token, unique: true) unless index_exists?(:phone_number_tags, :brain_token)
  end
end
