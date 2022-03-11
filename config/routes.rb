Rails.application.routes.draw do
  get '/movie', to: 'movies#index'
end
