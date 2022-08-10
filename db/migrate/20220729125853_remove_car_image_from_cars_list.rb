# frozen_string_literal: true

class RemoveCarImageFromCarsList < ActiveRecord::Migration[6.1]
  def change
    remove_column :cars_lists, :car_image, :blob
  end
end
