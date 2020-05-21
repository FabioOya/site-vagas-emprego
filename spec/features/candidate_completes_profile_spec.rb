require 'rails_helper'

feature 'Candidate automatically redirect to complete profile' do
  xscenario 'succesfully' do
    candidate = create(:candidate)

    login_as candidate, scope: :candidate
    visit root_path
    
    expect(current_path).to eq(new_profile_path)
    fill_in 'Nome completo', with: 'Fabio Iwao Oya'
    attach_file('Foto', '/home/fabio_iwao/site-vagas-emprego/app/assets/profile.png')
    fill_in 'Nome social', with: 'Joao'
    fill_in 'Data de nascimento', with: '03/08/1993'
    fill_in 'Formação', with: 'Ensino Superior'
    fill_in 'Descrição', with: 'Uma descrição'
    fill_in 'Experiência', with: 'Uma Experiência' 
    click_on 'Enviar'
    
    expect(current_path).to eq profile_path(Profile.last.id)
    expect(page).to have_css('#photo')
    expect(page).to have_content('Fabio Iwao Oya')
    expect(page).to have_content('Joao')
    expect(page).to have_content('03/08/1993')
    expect(page).to have_content('Ensino Superior')
    expect(page).to have_content('Uma descrição')
    expect(page).to have_content('Uma Experiência')
  end

  xscenario 'log in and redirect if profile incomplete' do
    candidate = create(:candidate)
    login_as candidate, scope: :candidate
  
    visit root_path
    expect(current_path).to eq(new_profile_path)
  end 
end
