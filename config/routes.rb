Rails.application.routes.draw do
  get 'users/index'
  devise_for :users

  root "projects#index"
  
  namespace :admin do
  	resources :users
  end

  patch '/admin/user/:id/toggle_type', to: 'admin/users#toggle_type', as: :toggle_type
  patch '/admin/user/:id/toggle_status', to: 'admin/users#toggle_status', as: :toggle_status

end
