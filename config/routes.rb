Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root 'projects#index'
  
  namespace :admin, constraints: { id: /[0-9]+(\%7C[0-9]+)*/ } do
    resources :users do
      member do
        patch :toggle_active
      end
    end

    resources :clients

    resources :projects do
      resources :payments
    end
  end

  resources :clients

  resources :projects do
    resources :payments
  end
end
