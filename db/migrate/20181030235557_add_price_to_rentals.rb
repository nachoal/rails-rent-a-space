class AddPriceToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :price, :integer
  end
end
