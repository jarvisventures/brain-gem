class AddRolesToUsers < ActiveRecord::Migration#<%= Rails::VERSION::MAJOR >= 5 ? "[#{Rails.version.to_f}]" : "" %>
  def change
    # create table for the users if it doesn't exist
    create_table(:users) if !table_exists(:users)
    create_table(:departments) if !table_exists(:departments)

    # add all of the user properties
    add_column(:users, :first_name, :string) if !column_exists(:users, :first_name)
    add_column(:users, :last_name, :string) if !column_exists(:users, :last_name)
    add_column(:users, :email, :string) if !column_exists(:users, :email)

  end
end
