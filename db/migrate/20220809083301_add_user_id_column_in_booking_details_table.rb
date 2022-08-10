# frozen_string_literal: true

class AddUserIdColumnInBookingDetailsTable < ActiveRecord::Migration[6.1]
  def change
    add_reference :booking_details, :users, null: true, foreign_key: { on_delete: :cascade, on_update: :cascade }
  end
end
