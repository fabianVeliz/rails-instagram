Rails.application.routes.draw do

  get 'followings/create'

  devise_for :users

  resources :photos, except: [:update, :destroy, :edit] do
    resources :comments, only: [:create]
  end

  get '/:user_name', to: 'users#profile', as: 'user_profile'
  
  resources :followings, only: :create

  root 'photos#index'

end
