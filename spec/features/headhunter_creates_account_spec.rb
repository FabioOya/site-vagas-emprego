require 'rails_helper'

feature 'Headhunter creates account' do
  
  scenario 'succesfully' do
    
    visit root_path
    click_on 'Cadastrar Headhunter'
    fill_in 'Email', with: 'teste@teste.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar Senha', with: '12345678'
    click_on 'Cadastrar'
    
    expect(page).to have_content('Login efetuado com sucesso')
    expect(current_path).to eq(root_path)
  end
  
  scenario 'log in' do
    headhunter = create(:head_hunter)
    
    visit root_path
    click_on 'Entrar - Headhunter'

    expect(current_path).to eq(new_head_hunter_session_path)

    fill_in 'Email', with: headhunter.email
    fill_in 'Senha', with: headhunter.password
    click_on 'Entrar'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(page).to have_content('Sair')
    expect(page).not_to have_content('Entrar')
    expect(current_path).to eq(root_path)
  end

  scenario 'log out' do
    headhunter = create(:head_hunter)
    
    login_as headhunter, scope: :head_hunter
    visit root_path
    click_on 'Sair'

    expect(page).to have_content('Saiu com sucesso')
    expect(page).to have_content('Entrar')
    expect(page).not_to have_content('Sair')
    expect(current_path).to eq(root_path)
  end

  scenario 'validates all fields' do

    visit root_path
    click_on 'Cadastrar Headhunter'
    fill_in 'Email', with: ''
    fill_in 'Senha', with: ''
    fill_in 'Confirmar Senha', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Email não pode ficar em branco')
    expect(page).to have_content('Senha não pode ficar em branco')
  end

  scenario 'unmatch passwords' do
    
    visit root_path
    click_on 'Cadastrar Headhunter'
    fill_in 'Email', with: 'test@test.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar Senha', with: '87654321'
    click_on 'Cadastrar'

    expect(page).to have_content('Confirmar Senha não é igual a Senha')
  end
end