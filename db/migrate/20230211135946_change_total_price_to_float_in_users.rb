class ChangeTotalPriceToFloatInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :total_price, :float
  end
end
