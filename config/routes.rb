Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"

  get "help" => "static_pages#help"
  get "about" => "static_pages#about"

  resources :albums
  resources :photos
  resources :blogs

  namespace :admin do
    resources :companies
    resources :catelogs
    resources :products
    resources :albums do
      resources :photos do
        resources :images, only: :create
      end
    end
  end
end
