class AdminsController < ApplicationController
  skip_before_action :ensure_user_logged_in
    
    def admin
        if params[:user][:email] == "taxido.admin@taxido.com" && params[:user][:password] == "ADMINPAVAN"
            redirect_to admin_power_path
        else
            render plain: "failed"
        end
    end
end
