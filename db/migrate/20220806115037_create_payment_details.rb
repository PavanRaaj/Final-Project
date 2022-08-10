# frozen_string_literal: true

class CreatePaymentDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_details do |t|
      t.string :card_holder_name
      t.string :cvv_number
      t.bigint :atm_card_number
      t.string :card_expiry_month
      t.integer :card_expiry_year

      t.timestamps
    end
  end
end
