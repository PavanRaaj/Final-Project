# frozen_string_literal: true

class AdminsController < ApplicationController
  # skip_before_action :ensure_user_logged_in

  before_action :ensure_admin

  def ensure_admin
    redirect_to '/homes/login' unless current_user.role == 'admin'
  end

  def admin_power
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def new_car
    car_list = CarsList.new
  end

  def admin_add_car
    car_list = CarsList.new(car_list_params)
    car_list.car_image.attach(car_list_params[:car_image])
    if car_list.save
      redirect_to admin_power_path
    else
      flash[:error] = car_list.errors.full_messages.join(',')
      redirect_to '/admins/admin_adding_car'

    end
  end

  def remove_car
    @del = CarsList.find(params[:id])
    redirect_to admin_power_path if @del.destroy
  end

  private

  def car_list_params
    params.require(:car_list).permit(:owner_mobile_number, :car_registration_number, :car_name, :per_day_price,
                                     :car_owner_name, :car_image, :KM_driven, :fuel_type)
  end
end
