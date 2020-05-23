FactoryBot.define do
  factory :commentary do
    sequence(:text) { |n| "Comentario#{n}" }
    head_hunter
    profile 
  end
end
