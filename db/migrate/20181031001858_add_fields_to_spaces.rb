class AddFieldsToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :wifi, :boolean
    add_column :spaces, :parking, :boolean
    add_column :spaces, :cleaning, :boolean
    add_column :spaces, :bathrooms, :integer
  end
end
