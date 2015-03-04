Rails.application.routes.draw do

  devise_for :users

  resources :photos, except: [:update, :destroy, :edit]

  root 'photos#index'

end
