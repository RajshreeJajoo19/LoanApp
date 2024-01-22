class ChangeDataTypeInLoans < ActiveRecord::Migration[7.1]
    def change
      change_column :loans, :pincode, :string
    end
end
