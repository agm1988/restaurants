Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    member do
      post :rate
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'restaurants#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
