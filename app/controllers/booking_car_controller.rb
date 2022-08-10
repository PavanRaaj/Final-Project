# frozen_string_literal: true

$booking_car = nil
class BookingCarController < ApplicationController
  # skip_before_action :ensure_user_logged_in

  @@array = []
  @@presence_value = 0

  def search
    @parameter = params[:search]
    @@array = []
    puts @parameter
    @results = CarsList.where('car_name LIKE?', "%#{@parameter}%")
    @@presence_value = 1
    @results.each do |result|
      @@array.push(result.id)
      puts result.car_name
    end
    redirect_to listing_cars_path
  end

  def array_returner
    @@array
  end

  def presence_value_returner
    @@presence_value
  end

  @@car = nil
  @@booking_detail = nil
  def booking_page
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def listing_cars
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end

    @search_details = CarsList.all
    @presence = 0
    @presence_value = presence_value_returner
    @search_params = array_returner
    @presence = 1 if @search_params == []
    @@array = []
    @@presence_value = 0
  end

  @@booking_id = nil
  def booking_car
    booking_detail = BookingDetail.new
  end

  def booking_detail
    current_user
    booking_detail = BookingDetail.new(pick_up_point: booking_params[:pick_up_point],
                                       pick_up_city: booking_params[:pick_up_city], pick_up_date: booking_params[:pick_up_date], pick_up_time: booking_params[:pick_up_time], end_date: booking_params[:end_date], end_time: booking_params[:end_time], users_id: current_user.id)
    if booking_detail.save
      @@booking_id = booking_detail.id
      session[:booking_user_id] = booking_detail.id
      redirect_to listing_cars_path
    else
      render plain: 'False'
    end
  end

  def booking_id_returner
    @@booking_id
  end

  def car_returner
    @@car
  end

  def booking_detail_returner
    @@booking_detail
  end

  def car_id_setter
    @id = booking_id_returner
    @booking_record = BookingDetail.find(@id)
    @booking_record.cars_lists_id = params[:car_id]
    @car_record = CarsList.find(params[:car_id])

    @@booking_detail = @booking_record
    if @booking_record.save
      @@car = @car_record
      puts '-----------------------'
      puts @@booking_detail.id

      redirect_to booking_confirmation_path
    else
      render plain: 'Failed'
    end
  end

  def booking_confirmation_page
    @car = car_returner
    @booking_detail = booking_detail_returner
    puts '==='
    puts @booking_detail.id
  end

  private

  def booking_params
    params.require(:booking_detail).permit(:pick_up_point, :pick_up_city, :pick_up_date, :pick_up_time, :end_date,
                                           :end_time)
  end
end
