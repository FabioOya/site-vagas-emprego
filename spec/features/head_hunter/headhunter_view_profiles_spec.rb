require 'rails_helper'

feature 'Headhunter view candidates profiles' do
  scenario 'sucessfully' do
    headhunter = create(:head_hunter)
    candidate = Candidate.create!(email: 'test@test.com.br', password: '12345678')
    profile = create(:profile, candidate: candidate)
    another_candidate = create(:candidate)
    another_profile = create(:profile, candidate: another_candidate)

    login_as headhunter, scope: :head_hunter
    visit root_path
    click_on "Ver candidatos cadastrados"
    
    expect(page).to have_css('#photo')
    expect(page).to have_content (profile.social_name)
    expect(page).to have_content (profile.formation)
    expect(page).to have_content (profile.description)
    expect(page).to have_content (another_profile.social_name)
    expect(page).to have_content (another_profile.formation)
    expect(page).to have_content (another_profile.description)
  end

  scenario 'cannot view unless logged in' do
    visit profiles_path
    
    expect(current_path).to eq(new_head_hunter_session_path)
  end
end