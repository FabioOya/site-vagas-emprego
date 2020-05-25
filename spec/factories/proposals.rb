FactoryBot.define do
  factory :proposal do
    begin_date { "2020-05-24" }
    salary { "9.99" }
    benefits { "MyString" }
    role { "MyString" }
    head_hunter { nil }
    job { nil }
    profile { nil }
  end
end
