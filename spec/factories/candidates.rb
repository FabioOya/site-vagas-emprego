FactoryBot.define do
  factory :candidate do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '12345678' }
  end
end
