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

    expect(page).to have_content('Um comentário')
  end
  scenario 'and view commentaries' do
    headhunter = create(:head_hunter)
    profile = create(:profile)
    commentary = create(:commentary, profile: profile, head_hunter: headhunter)

    login_as headhunter, scope: :head_hunter

    visit profile_path(profile)

    expect(page).to have_content(commentary.text)
    expect(page).to have_content(I18n.l(commentary.created_at))
  end
end 
 