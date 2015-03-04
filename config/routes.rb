Rails.application.routes.draw do


  devise_for :users

  resources :photos, except: [:update, :destroy, :edit]

  resources :my_photos, only: [:index]

  resources :users, only: [:show]

  root 'photos#index'

end
