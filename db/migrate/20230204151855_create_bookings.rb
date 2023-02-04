class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :vinyl, foreign_key: true
      t.integer :renting_days
      t.integer :total_price
      t.date :start_date
      t.date :end_time
      t.timestamps
    end
  end
end

