# frozen_string_literal: true

Rails.application.routes.draw do
  mount Mcore::Engine => '/', as: 'mcore'
end
