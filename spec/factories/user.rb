FactoryBot.define do
  factory :user,  class: Mcore::User do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password {123123123}
  end
end
