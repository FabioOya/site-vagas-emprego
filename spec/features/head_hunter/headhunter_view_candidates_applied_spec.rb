require 'rails_helper'

feature 'Headhunter can view all users who applied to a job' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile)
    another_profile = create(:profile)
    apply = create(:apply_job, job: job, profile: profile)
    another_apply = create(:apply_job, job: job, profile: profile)

    login_as headhunter, scope: :head_hunter

    visit root_path
    click_on 'Vagas'
    click_on 'Ver Detalhes'
    click_on 'Candidatos'

    expect(page).to have_content('Candidatos aplicados na sua vaga')
    expect(page).to have_content(profile.full_name)
    expect(page).to have_content(another_profile.full_name)
  end

  scenario 'and can view candidate profiles' do
    headhunter = create(:head_hunter)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile, full_name: "Um Nome")
    another_profile = create(:profile, full_name: "Outro nome")
    apply = create(:apply_job, job: job, profile: profile)
    another_apply = create(:apply_job, job: job, profile: another_profile)

    login_as headhunter, scope: :head_hunter

    visit root_path
    click_on 'Vagas'
    click_on 'Ver Detalhes'
    click_on 'Candidatos'
    click_on profile.full_name

    expect(page).to have_content(profile.full_name)
    expect(page).to have_content(profile.social_name)
    expect(page).to have_content(I18n.l(profile.birthdate))
    expect(page).to have_content(profile.formation)
    expect(page).to have_content(profile.description)
    expect(page).to have_content(profile.experience)
  end
end