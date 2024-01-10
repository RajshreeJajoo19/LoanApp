class CreateLoans < ActiveRecord::Migration[7.1]
  def change
    create_table :loans do |t|
      t.string :name
      t.string :purpose
      t.decimal :amount
      t.decimal :ssn
      t.timestamps
    end
  end
end
