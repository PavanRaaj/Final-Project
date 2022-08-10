# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    redirect_to '/homes/login' unless current_user
  end

  def current_user
    return @current_user if @current_user

    user_id = session[:current_user_id]
    @current_user = User.find(user_id) if user_id
  end

  def booking_user
    return @booking_user if @booking_user

    booking_id = session[:booking_user_id]
    @booking_user = BookingDetail.find(booking_id) if booking_id
  end
end
