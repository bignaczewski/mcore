# frozen_string_literal: true

Mcore::Engine.routes.draw do
  devise_for :users, class_name: "Mcore::User"
  resources :posts
  root to: 'posts#index'
end
