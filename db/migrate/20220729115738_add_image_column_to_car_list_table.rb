class AddImageColumnToCarListTable < ActiveRecord::Migration[6.1]
  def change
    add_column :cars_lists, :car_image, :blob
  end
end
