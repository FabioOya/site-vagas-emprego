require 'rails_helper'

feature 'Headhunter marks profile as featured' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    candidate = create(:candidate)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile, candidate: candidate)
    apply = create(:apply_job, job: job, profile: profile)

    login_as headhunter, scope: :head_hunter

    visit candidates_applied_job_path(job)
    click_on 'Destacar'
    expect(current_path).to eq(candidates_applied_job_path(job))
    expect(page).to have_content('Candidato destacado')
  end
  scenario 'and unmarks feature' do
    headhunter = create(:head_hunter)
    candidate = create(:candidate)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile, candidate: candidate, featured: 1)
    apply = create(:apply_job, job: job, profile: profile)

    login_as headhunter, scope: :head_hunter

    visit candidates_applied_job_path(job)
    save_page
    click_on 'Destacar'
    expect(current_path).to eq(candidates_applied_job_path(job))
    expect(page).not_to have_content('Candidato destacado')
  end
end 