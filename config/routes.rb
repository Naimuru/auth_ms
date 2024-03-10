Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sign_up', to: 'registrations#create', as: 'user_registration'
        post 'sign_in', to: 'sessions#create', as: 'user_login'
        delete 'sign_out', to: 'sessions#destroy', as: 'user_logout'
      end
    end
  end
end
