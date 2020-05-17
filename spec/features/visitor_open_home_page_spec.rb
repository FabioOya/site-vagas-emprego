require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'succesfully' do
    visit root_path

    expect(page).to have_content('Job Site')
    expect(page).to have_content('Bem vindo ao site de vagas de emprego')  
  end
end