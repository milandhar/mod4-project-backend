Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :update, :index, :displayPets]
      get '/displayPets', to: 'users#displayPets'
      post '/login', to: 'auth#create'
      get 'profile', to: 'users#profile'
      resources :pets, only: [:create, :edit, :index]
      resources :user_pets, only: [:create, :edit, :index]
    end
  end
end
