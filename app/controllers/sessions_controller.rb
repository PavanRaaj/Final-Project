class SessionsController < ApplicationController
    
    skip_before_action :ensure_user_logged_in
    
    
    def login
        @user = User.find_by(email: params[:user][:email])
        # p @user
        if @user && @user.authenticate(params[:user][:password])
            session[:current_user_id] = @user.id
            redirect_to root_path
        else
            render plain: "failed"
        end

    end

end
