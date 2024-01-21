class AddFieldsToLoan < ActiveRecord::Migration[7.1]
  def change

    add_column :loans, :lastName, :string
    add_column :loans, :Address, :string
    add_column :loans, :city, :string
    add_column :loans, :state, :string
    add_column :loans, :pincode, :numeric
    add_column :loans, :maritalstatus, :string
    add_column :loans, :dependents, :string
    add_column :loans, :dateOfBirth, :string
    add_column :loans, :busiessNumber, :string
  end
end
