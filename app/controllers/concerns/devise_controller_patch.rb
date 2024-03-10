# app/controllers/concerns/devise_controller_patch.rb
module DeviseControllerPatch
    extend ActiveSupport::Concern
  
    included do
      before_action :skip_devise_flash
    end
  
    def skip_devise_flash
      flash = nil # Override flash to be nil
    end
  end
  