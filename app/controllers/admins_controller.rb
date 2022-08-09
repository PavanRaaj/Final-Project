class AdminsController < ApplicationController
  skip_before_action :ensure_user_logged_in
    
    def admin
        if params[:user][:email] == "taxido.admin@taxido.com" && params[:user][:password] == "ADMINPAVAN"
            redirect_to admin_power_path
        else
            render plain: "failed"
        end
    end

   def new_car
    car_list = CarsList.new
   end
   
   def admin_add_car
    car_list = CarsList.new( car_list_params )
    car_list.car_image.attach( car_list_params[:car_image])
    if car_list.save
        redirect_to admin_power_path
    end
   end
 
   def remove_car
    @del = CarsList.find(params[:id])
    if @del.destroy
    redirect_to admin_power_path
    end
   end

   private

   def car_list_params
    params.require(:car_list).permit(:owner_mobile_number, :car_registration_number, :car_name, :per_day_price, :car_owner_name, :car_image, :KM_driven, :fuel_type)
   end


end
