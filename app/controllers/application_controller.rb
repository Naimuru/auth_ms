class ApplicationController < ActionController::API
    include DeviseControllerPatch
    include ActionController::MimeResponds
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:emailAddr, :userName, :nickname, :keyIdAuth])
      devise_parameter_sanitizer.permit(:account_update, keys: [:emailAddr, :userName, :nickname, :keyIdAuth])
    end
  end
  