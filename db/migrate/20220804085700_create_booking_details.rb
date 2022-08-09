class CreateBookingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_details do |t|
      t.string :pick_up_point
      t.string :pick_up_city
      t.date :pick_up_date
      t.time :pick_up_time
      t.date :end_date
      t.time :end_time
      t.references :cars_lists, null: true, foreign_key: {on_delete: :cascade,on_update: :cascade}

      t.timestamps
    end
  end
end
