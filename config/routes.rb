Rails.application.routes.draw do

  devise_for :users

  resources :photos, except: [:update, :destroy, :edit] do
    resources :comments, only: [:create]
  end

  resources :followings, only: [:create, :destroy]

  resources :users, only: :index

  get '/:user_name', to: 'users#profile', as: 'user_profile'

  root 'photos#index'

end
