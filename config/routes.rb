Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root 'projects#index'
  
  namespace :admin do
    resources :users do
      member do
        patch :toggle_active
      end
    end
  end
end
