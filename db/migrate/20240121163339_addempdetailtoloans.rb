class Addempdetailtoloans < ActiveRecord::Migration[7.1]
  def change

    add_column :loans, :jobtitle, :string
    add_column :loans, :companyname, :string
    add_column :loans, :companyaddress, :string
  end
end
