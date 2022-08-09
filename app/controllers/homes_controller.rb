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

  

  def new
    current_user
    user = User.new
  end

  def create
    user = User.new( user_params )
    if  user.save
    session[:current_user_id] = user.id
    redirect_to root_path
    end
  end

  private 

  def user_params
   params.require(:user).permit(:user_name, :email, :password)
  end

end
