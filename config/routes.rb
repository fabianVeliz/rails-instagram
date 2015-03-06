Rails.application.routes.draw do

  devise_for :users

  resources :photos, except: [:update, :destroy, :edit] do
    resources :comments, only: [:new, :create]
  end

  get '/:user_name', to: 'users#profile', as: 'user_profile'

  root 'photos#index'

end
