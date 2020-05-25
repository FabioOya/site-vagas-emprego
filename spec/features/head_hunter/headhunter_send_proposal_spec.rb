require 'rails_helper'

feature 'Headhunter send proposal' do
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
    click_on 'Enviar proposta'

    fill_in 'Data de inicio', with: '05/08/2015'
    fill_in 'Salário', with: '500000'
    fill_in 'Benefícios', with: 'beneficios'
    fill_in 'Funções', with: 'desenvolver dapps'
    
    click_on 'Enviar'

    expect(page).to have_content('Proposta enviada!')
  end
end 