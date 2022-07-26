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
    if car_list.save
    render plain: "sucess"
    end
   end

   private

   def car_list_params
    params.require(:car_list).permit(:owner_mobile_number, :car_registration_number, :car_name, :per_day_price)
   end


end
