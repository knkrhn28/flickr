# encoding: utf-8

Rails.application.routes.draw do
  # root path
  root 'search#search_request'

  # a simple get-post route
  get 'search' => 'search#search_request'
  post 'search' => 'search#search_response'

  # authentication routes
  devise_for :users
end
