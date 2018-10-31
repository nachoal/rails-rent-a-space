class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string
  end
end
