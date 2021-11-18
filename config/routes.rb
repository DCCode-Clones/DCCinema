# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "main#index"
  get 'main', to: 'main#index'
  get 'movies/new', to: 'movies#new'
  post 'movies/create', to: 'movies#create'
  get 'schedules/:id', to: 'schedules#show'
  patch 'schedules/:id/reserve', to: 'schedules#reserve'
  resources :schedules
end
