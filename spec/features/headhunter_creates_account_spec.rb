require 'rails_helper'

feature 'Headhunter authentication' do
  scenario 'succesfully' do
    headhunter = Headhunter.create!(email: 'teste@teste.com.br', password: '12345678')
    
    visit root_path
    click_on 'Entrar'
    fill_in 'Email', with 'teste@teste.com.br'
    fill_in 'Senha', with '12345678'
    click_on 'Entrar'

    expect(page).to have_content('Entrou com sucesso')
    expect(page).not_to have_link('Entrar')
    expect(page).to have_link('Sair')
    expect(current_path).to eq(root_path)

  end