# frozen_string_literal: true

class CreateContactUsDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_us_details do |t|
      t.string :name
      t.string :query

      t.timestamps
    end
  end
end
