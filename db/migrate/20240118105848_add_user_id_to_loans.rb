class AddUserIdToLoans < ActiveRecord::Migration[7.1]
  def change
    add_reference :loans, :user, foreign_key: true
  end
end
