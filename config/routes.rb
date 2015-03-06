Rails.application.routes.draw do

  devise_for :users

  resources :photos, except: [:update, :destroy, :edit]

  get '/:user_name/profile', to: 'users#profile', as: 'user'

  get '/:user_name/photos',  to: 'users#photos', as: 'user_photos'

  root 'photos#index'

end
