class AddNameToSpace < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :name, :string
  end
end
