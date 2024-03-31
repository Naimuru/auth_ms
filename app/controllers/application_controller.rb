class ApplicationController < ActionController::API
    include DeviseControllerPatch
    include ActionController::MimeResponds
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :keyIdAuth])
      devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :keyIdAuth])
    end
  end
  