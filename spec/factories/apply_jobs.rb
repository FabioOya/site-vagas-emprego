FactoryBot.define do
  factory :apply_job do
    reason { "Motivos para candidatura" }
    job
    profile
  end
end
