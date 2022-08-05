FactoryBot.define do
  factory :post, class: Mcore::Post do

    title { Faker::Name.name }
    description { 'SSS' }
    user
  end
end
