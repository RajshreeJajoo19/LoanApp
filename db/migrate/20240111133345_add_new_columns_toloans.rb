class AddNewColumnsToloans < ActiveRecord::Migration[7.1]
  def change

    add_column :loans, :email_address, :string
    add_column :loans, :income, :numeric
    add_column :loans, :status, :string
    add_column :loans, :phonenumber, :string
  end
end
