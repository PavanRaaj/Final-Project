class HomesController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def index
    # @todo_list = Todo.all
  end

  def new
    user = User.new
  end

  def create
    user = User.new( user_params )
    if  user.save
    redirect_to root_path
    end
  end

  private 

  def user_params
   params.require(:user).permit(:user_name, :email, :password)
  end

end
