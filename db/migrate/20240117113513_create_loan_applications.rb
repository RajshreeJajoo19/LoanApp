class CreateLoanApplications < ActiveRecord::Migration[7.1]
  def change
    create_table :loan_applications do |t|
      t.string :name
      t.string :email
      t.string :purpose
      t.string :amount
      t.string :ssn
      t.string :phonenumber
      t.string :income
      t.timestamps
    end
  end
end
