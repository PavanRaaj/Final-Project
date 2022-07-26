class CreateCarsLists < ActiveRecord::Migration[6.1]
  def change
    create_table :cars_lists do |t|
      t.bigint :owner_mobile_number
      t.string :car_registration_number
      t.string :car_name
      t.bigint :per_day_price

      t.timestamps
    end
  end
end
