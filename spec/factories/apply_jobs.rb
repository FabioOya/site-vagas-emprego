FactoryBot.define do
  factory :apply_job do
    reason { "Motivos para candidatura" }
    rejected { 0 }
    job
    profile
  end
end
