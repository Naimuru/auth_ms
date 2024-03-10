module Api
    module V1
      class SessionsController < Devise::SessionsController
        # Skip CSRF protection - removed or commented out the next line
        # protect_from_forgery with: :null_session
  
        before_action :prepare_response_format
  
        def create
          self.resource = warden.authenticate!(auth_options)
          sign_in(resource_name, resource)
          render json: { success: true, message: 'Signed in successfully.', user: resource }, status: :ok
        end
  
        def destroy
          if current_user
            sign_out
            render json: { success: true, message: 'Signed out successfully.' }, status: :ok
          else
            render json: { success: false, message: 'Could not log out. No user was signed in.' }, status: :unauthorized
          end
        end
  
        private
  
        def prepare_response_format
          request.format = :json
        end
  
        def respond_to_on_destroy
          # No redirect or format-specific response needed for API-only applications
        end
      end
    end
  end
  