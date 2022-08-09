class AddBookingIdColumnInPaymentDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :payment_details, :booking_details, null: true, foreign_key: {on_delete: :cascade,on_update: :cascade}
  end
end
