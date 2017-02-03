# encoding: utf-8

Rails.application.routes.draw do
  # root path
  root 'search#search_request'

  # a simple get-post route
  get 'search' => 'search#search_request'
  post 'search' => 'search#search_response'

  # authentication (devise) routes
  devise_for :users

  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login
    get 'update', to: 'devise/registrations#edit', as: :update
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'recover', to: 'devise/passwords#new', as: :recover
  end
end
