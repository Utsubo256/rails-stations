Rails.application.routes.draw do
  get '/movies', to: 'movies#index'
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
