class ApplicationController < ActionController::API
    include DeviseControllerPatch
    include ActionController::MimeResponds
end
