# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'Mcore::User' do
    first_name { 'Bartosz' }
    last_name  { 'Ignaczewski' }
    email { 'bartosz.p.ignaczewski@gmail.com' }
  end
end
