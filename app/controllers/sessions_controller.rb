# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def login
    @user = User.find_by(email: params[:user][:email])
    # p @user
    if @user&.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      if @user.role == 'admin'
        redirect_to admin_power_path
      else
        redirect_to root_path
      end
    else
      flash[:error] = 'Invalid Email or Password'
      redirect_to '/homes/login'
    end
  end

  def logout
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to '/'
  end
end
