FactoryBot.define do
  factory :user do
    email {Faker::Internet.unique.email}
    name {Faker::Name.name}
    password {"Bach123456"}
    role {0}
  end
end
