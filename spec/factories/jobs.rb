FactoryBot.define do
  factory :job do
    sequence(:title) { |n| "Job#{n}"}
    description { "Descrição vaga emprego" }
    skills { "Habilidades" }
    salary { "Salario" }
    job_level { "Estágiario" }
    end_date { "#{1.month.from_now}" }
    location { "Pinheiros" }
    head_hunter { create(:head_hunter) }
  end
end