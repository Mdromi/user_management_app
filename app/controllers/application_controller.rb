class ApplicationController < ActionController::Base
    before_action :check_user_status, unless: :devise_controller?
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def check_user_status
      if current_user && current_user.status == 'blocked'
        sign_out current_user
        redirect_to new_user_session_path, alert: 'Your account has been blocked.'
      elsif !current_user
        redirect_to new_user_session_path
      end
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def after_sign_in_path_for(resource)
        current_user.update(last_login_time: Time.current)
        super(resource)
      end
  end
  