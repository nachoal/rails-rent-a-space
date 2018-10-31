class AddCoordinatesToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :latitude, :float
    add_column :spaces, :longitude, :float
  end
end
