FactoryBot.define do
  factory :apply_job do
    status { 0 }
    reason { "Motivos para candidatura" }
    job
    profile
  end
end
