class AddCarImageToCarsList < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_lists, :car_image, :binary
  end
end
