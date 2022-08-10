# frozen_string_literal: true

class AddFuelColumnToCarListTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_lists, :fuel_type, :string
  end
end
