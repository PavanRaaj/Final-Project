# frozen_string_literal: true

class PaymentsController < ApplicationController
  def payment_page
    @booking_user = booking_user
    booking_user
    @car_detail = CarsList.find(booking_user.cars_lists_id)

    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def ending_page
    @booking_user = booking_user
    booking_user
    @car_detail = CarsList.find(booking_user.cars_lists_id)

    current_user
    @user = User.find(current_user.id)
    session[:booking_user_id] = nil
  end

  def payment_details
    booking_user
    payment_details = PaymentDetail.new(card_holder_name: payment_params[:card_holder_name],
                                        cvv_number: payment_params[:cvv_number], atm_card_number: payment_params[:atm_card_number], card_expiry_month: payment_params[:card_expiry_month], card_expiry_year: payment_params[:card_expiry_year], booking_details_id: booking_user.id)
    if payment_details.save
      redirect_to ending_page_path
    else
      render plain: 'Failed'
    end
  end

  private

  def payment_params
    params.require(:payment_details).permit(:card_holder_name, :cvv_number, :atm_card_number, :card_expiry_month,
                                            :card_expiry_year)
  end
end
