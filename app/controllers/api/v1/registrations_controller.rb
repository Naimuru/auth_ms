# app/controllers/api/v1/registrations_controller.rb
module Api
    module V1
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json
  
        # Intercept any calls to `flash` to prevent errors
        def flash
          @flash ||= ActionDispatch::Flash::FlashHash.new
        end
  
        def create
          build_resource(sign_up_params)
  
          resource.save
          if resource.persisted?
            if resource.active_for_authentication?
              render json: { message: 'Signed up successfully.', user: resource }, status: :created
            else
              render json: { message: "Signed up but #{resource.inactive_message}" }, status: :ok
            end
          else
            render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
          end
        end
  
        private
  
        def respond_with(resource, _opts = {})
          render json: resource
        end
  
        def respond_to_on_destroy
          head :no_content
        end
      end
    end
  end
  