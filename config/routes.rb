# frozen_string_literal: true

Mcore::Engine.routes.draw do
  resources :users do
    resources :posts
  end
end
