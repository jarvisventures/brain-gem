class AddFields < ActiveRecord::Migration<%= Rails::VERSION::MAJOR >= 5 ? "[#{Rails.version.to_f}]" : "" %>
  def change
    # create table for the users if it doesn't exist
    create_table(:companies) unless table_exists?(:companies)
    create_table(:divisions) unless table_exists?(:divisions)
    create_table(:departments) unless table_exists?(:departments)
    create_table(:users) unless table_exists?(:users)

    # add all of the company properties
    add_column(:companies, :name, :string) unless column_exists?(:companies, :name)
    add_column(:companies, :token, :string) unless column_exists?(:companies, :token)
    add_column(:companies, :active, :boolean) unless column_exists?(:companies, :active)

    # add all of the divisions properties
    add_column(:divisions, :name, :string) unless column_exists?(:divisions, :name)
    add_reference(:divisions, :company, foreign_key: true) unless column_exists?(:divisions, :company_id)

    # add all of the divisions properties
    add_column(:departments, :name, :string) unless column_exists?(:departments, :name)
    add_reference(:departments, :company, foreign_key: true) unless column_exists?(:departments, :company_id)

    # add all of the user properties
    add_reference(:users, :company, foreign_key: true) unless column_exists?(:users, :company_id)
    add_reference(:users, :division, foreign_key: true) unless column_exists?(:users, :division_id)
    add_reference(:users, :department, foreign_key: true) unless column_exists?(:users, :department_id)
    add_column(:users, :first_name, :string) unless column_exists?(:users, :first_name)
    add_column(:users, :last_name, :string) unless column_exists?(:users, :last_name)
    add_column(:users, :email, :string) unless column_exists?(:users, :email)
    add_column(:users, :token, :string) unless column_exists?(:users, :token)
    add_column(:users, :address_1, :string) unless column_exists?(:users, :address_1)
    add_column(:users, :address_2, :string) unless column_exists?(:users, :address_2)
    add_column(:users, :city, :string) unless column_exists?(:users, :city)
    add_column(:users, :state, :string) unless column_exists?(:users, :state)
    add_column(:users, :country, :string) unless column_exists?(:users, :country)
    add_column(:users, :zipcode, :string) unless column_exists?(:users, :zipcode)
    add_column(:users, :home_phone, :string) unless column_exists?(:users, :home_phone)
    add_column(:users, :mobile_phone, :string) unless column_exists?(:users, :mobile_phone)
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
    add_column(:users, :jarvis_token, :string) unless column_exists?(:users, :jarvis_token)

  end
end
