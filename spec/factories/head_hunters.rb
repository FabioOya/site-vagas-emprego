FactoryBot.define do
  factory :head_hunter do
    sequence(:email) { |n| "email#{n}@test.com.br" }
    password { '12345678' }
  end
end
