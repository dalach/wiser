Rails.application.routes.draw do
  root 'quotes#index'
  resources :quotes
  resources :authors
end
