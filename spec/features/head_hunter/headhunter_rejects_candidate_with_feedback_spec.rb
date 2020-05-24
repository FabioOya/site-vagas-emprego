require 'rails_helper'

feature 'Headhunter rejects candidate with feedback' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    candidate = create(:candidate)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile, candidate: candidate)
    apply = create(:apply_job, job: job, profile: profile)

    login_as headhunter, scope: :head_hunter

    visit root_path
    click_on 'Vagas'
    click_on 'Ver Detalhes'
    click_on 'Candidatos'
    click_on 'Rejeitar'


    expect(page).to have_content('Perfil rejeitado')
   
    fill_in 'Feedback', with: 'Você foi rejeitado para a vaga'
    click_on 'Enviar Feedback'
  end
end 

feature 'Candidate view feedbacks on profile' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    candidate = create(:candidate)
    job = create(:job, head_hunter: headhunter)
    profile = create(:profile, candidate: candidate)
    apply = create(:apply_job, job: job, profile: profile,  
                   reject_feedback: 'Você foi rejeitado para a vaga')
    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Feedbacks'

    expect(page).to have_content(job.title)
    expect(page).to have_content(apply.reject_feedback)
  end
end 