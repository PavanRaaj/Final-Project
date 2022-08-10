# frozen_string_literal: true

class AddColumnInCarsListsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_lists, :car_owner_name, :string
  end
end
