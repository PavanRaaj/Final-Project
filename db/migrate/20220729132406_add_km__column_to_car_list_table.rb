# frozen_string_literal: true

class AddKmColumnToCarListTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_lists, :KM_driven, :integer
  end
end
