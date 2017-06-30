class AddFields < ActiveRecord::Migration<%= Rails::VERSION::MAJOR >= 5 ? "[#{Rails.version.to_f}]" : "" %>
  def change
    # create table for the users if it doesn't exist
    create_table(:companies) if !table_exists?(:companies)
    create_table(:divisions) if !table_exists?(:divisions)
    create_table(:departments) if !table_exists?(:departments)
    create_table(:users) if !table_exists?(:users)

    # add all of the company properties
    add_column(:companies, :name, :string) if !column_exists?(:companies, :name)
    add_column(:companies, :token, :string) if !column_exists?(:companies, :token)
    add_column(:companies, :active, :boolean) if !column_exists?(:companies, :active)

    # add all of the divisions properties
    add_column(:divisions, :name, :string) if !column_exists?(:divisions, :name)
    add_reference(:divisions, :company, foreign_key: true) if !column_exists?(:divisions, :company_id)

    # add all of the divisions properties
    add_column(:departments, :name, :string) if !column_exists?(:departments, :name)
    add_reference(:departments, :company, foreign_key: true) if !column_exists?(:departments, :company_id)

    # add all of the user properties
    add_reference(:users, :company, foreign_key: true) if !column_exists?(:users, :company_id)
    add_reference(:users, :division, foreign_key: true) if !column_exists?(:users, :division_id)
    add_reference(:users, :department, foreign_key: true) if !column_exists?(:users, :department_id)
    add_column(:users, :first_name, :string) if !column_exists?(:users, :first_name)
    add_column(:users, :last_name, :string) if !column_exists?(:users, :last_name)
    add_column(:users, :email, :string) if !column_exists?(:users, :email)
    add_column(:users, :token, :string) if !column_exists?(:users, :token)
    add_column(:users, :address_1, :string) if !column_exists?(:users, :address_1)
    add_column(:users, :address_2, :string) if !column_exists?(:users, :address_2)
    add_column(:users, :city, :string) if !column_exists?(:users, :city)
    add_column(:users, :state, :string) if !column_exists?(:users, :state)
    add_column(:users, :country, :string) if !column_exists?(:users, :country)
    add_column(:users, :zipcode, :string) if !column_exists?(:users, :zipcode)
    add_column(:users, :home_phone, :string) if !column_exists?(:users, :home_phone)
    add_column(:users, :mobile_phone, :string) if !column_exists?(:users, :mobile_phone)
    add_column(:users, :age, :integer) if !column_exists?(:users, :age)
    add_column(:users, :date_of_birth, :date) if !column_exists?(:users, :date_of_birth)
    add_column(:users, :ethnicity, :string) if !column_exists?(:users, :ethnicity)
    add_column(:users, :gender, :string) if !column_exists?(:users, :gender)
    add_column(:users, :marital_status, :string) if !column_exists?(:users, :marital_status)
    add_column(:users, :active, :boolean) if !column_exists?(:users, :active)
    add_column(:users, :employee_number, :string) if !column_exists?(:users, :employee_number)
    add_column(:users, :hire_date, :date) if !column_exists?(:users, :hire_date)
    add_column(:users, :termination_date, :date) if !column_exists?(:users, :termination_date)
    add_column(:users, :ancestry, :string) if !column_exists?(:users, :ancestry)
    add_column(:users, :last_changed, :datetime) if !column_exists?(:users, :last_changed)
    add_column(:users, :employee_number, :string) if !column_exists?(:users, :employee_number)

  end
end
