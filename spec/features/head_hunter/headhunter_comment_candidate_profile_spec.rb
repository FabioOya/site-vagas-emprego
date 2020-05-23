require 'rails_helper'

feature 'Headhunter can comment on user profile' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    profile = create(:profile)
    job = create(:job, head_hunter: headhunter)
    apply = create(:apply_job, job: job, profile: profile)

    login_as headhunter, scope: :head_hunter

    visit profile_path(profile)

    fill_in 'Digite seu comentário', with: 'Um comentário'
    click_on 'Comentar'
  
    expect(page).to have_content(headhunter.email)
    expect(page).to have_content('Um comentário')
  end
  scenario 'comment two times' do

    headhunter = create(:head_hunter)
    profile = create(:profile)
    job = create(:job, head_hunter: headhunter)
    apply = create(:apply_job, job: job, profile: profile)
  
    login_as headhunter, scope: :head_hunter
  
    visit profile_path(profile)
  
    fill_in 'Digite seu comentário', with: 'Um comentário'
    click_on 'Comentar'
    fill_in 'Digite seu comentário', with: 'Outro comentário'
    click_on 'Comentar'

    expect(page).to have_content(headhunter.email)
    expect(page).to have_content('Um comentário')
    expect(page).to have_content('Outro comentário')
  end
  scenario 'and view commentaries and who wrote' do
    headhunter = create(:head_hunter)
    another_headhunter = create(:head_hunter)
    profile = create(:profile)
    commentary = create(:commentary, profile: profile, head_hunter: headhunter)
    another_commentary = create(:commentary, profile: profile, head_hunter: another_headhunter)

    login_as headhunter, scope: :head_hunter

    visit profile_path(profile)

    expect(page).to have_content(headhunter.email)
    expect(page).to have_content(commentary.text)
    expect(page).to have_content(I18n.l(commentary.created_at))
    expect(page).to have_content(another_headhunter.email)
    expect(page).to have_content(another_commentary.text)
    expect(page).to have_content(I18n.l(another_commentary.created_at))
  end
end 
 