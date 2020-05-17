require 'rails_helper'

feature 'Headhunter creates account' do
  scenario 'succesfully' do
    headhunter = HeadHunter.create!(email: 'teste@teste.com.br', password: '12345678')
    
    visit root_path
    click_on 'Cadastrar Headhunter'
    fill_in 'Email', with: 'teste@teste.com.br'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmar Senha', with: '12345678'
    click_on 'Cadastrar'

    expect(page).to have_content('Login efetuado com sucesso')
    expect(current_path).to eq(root_path)

  end
end