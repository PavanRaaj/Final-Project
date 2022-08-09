class ApplicationController < ActionController::Base
    before_action :ensure_user_logged_in

  
    def ensure_user_logged_in
        unless current_user
          redirect_to "/homes/login"
        end
    end

    

    def current_user
      return @current_user if @current_user
      user_id = session[:current_user_id]
      if user_id
          @current_user = User.find(user_id)
      else
        nil
      end
    end
   

    def booking_user
      return @booking_user if @booking_user
      booking_id = session[:booking_user_id]
      if booking_id
          @booking_user = BookingDetail.find(booking_id)
      else
        nil
      end
    end

end
