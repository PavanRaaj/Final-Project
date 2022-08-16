# frozen_string_literal: true

class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def become_a_host
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def contact_us_page
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
    else
      @presence = 0
    end
  end

  def new
    current_user
    user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = user.errors.full_messages.join(',')
      redirect_to '/homes/signup'
    end
  end

  def contact_us
    contact_us = ContactUsDetail.new
  end

  def contact_us_details
    current_user
    if current_user
      @user = User.find(current_user.id)
      @presence = 1
      contact_us = ContactUsDetail.new(name: @user.user_name, query: params[:query])
    else
      @presence = 0
      contact_us = ContactUsDetail.new(name: params[:name], query: params[:query])
    end
    if contact_us.save
      redirect_to '/'
    else
      render plain: 'failed'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end

  def contact_us_params
    params.require(:contact_us_details).permit(:name, :query)
  end
end
