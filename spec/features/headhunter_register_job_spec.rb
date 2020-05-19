require 'rails_helper'

feature 'Headhunter register job' do
  scenario 'succesfully' do
    headhunter = create(:head_hunter)

    login_as headhunter, scope: :head_hunter
    visit root_path
    click_on 'Vagas'
    click_on 'Cadastrar vaga'

    fill_in 'Vaga', with: 'Desenvolvedor Blockchain'
    fill_in 'Descrição', with: 'Trabalhar desenvolvendo DApps em blockchain'
    fill_in 'Habilidades', with: 'RoR, Solidity, Vyper, Go'
    fill_in 'Faixa salarial', with: 3000
    select 'Pleno', from: 'Nível da vaga'
    fill_in 'Data limite', with: '18/05/2021' 
    fill_in 'Localização', with: 'Trabalho Remoto'
    click_on 'Enviar'
    
    expect(current_path).to eq job_path(Job.last.id)
    expect(page).to have_content('Desenvolvedor Blockchain')
    expect(page).to have_content('Trabalhar desenvolvendo DApps em blockchain')
    expect(page).to have_content('RoR, Solidity, Vyper, Go')
    expect(page).to have_content("R$ 3.000,00")
    expect(page).to have_content('Pleno')
    expect(page).to have_content('18/05/2021')
    expect(page).to have_content('Trabalho Remoto')

  end
end
