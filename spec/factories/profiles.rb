FactoryBot.define do
  factory :profile do
    full_name { "Fabio Iwao Oya" }
    social_name { "Fabio" }
    birthdate { "03/08/1993" }
    formation { "Uma formação" }
    description { "Uma descrição" }
    experience { "Uma experiência" }
    candidate { create(:candidate) }
    featured { 0 }
  end
end
