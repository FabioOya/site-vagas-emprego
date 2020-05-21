require 'rails_helper'

feature 'Candidate completes profile' do
  scenario 'succesfully' do
    candidate = create(:candidate)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Completar perfil'

    fill_in 'Nome completo', with: 'Fabio Iwao Oya'
    fill_in 'Nome social', with: 'Joao'
    fill_in 'Data de nascimento', with: '03/08/1993'
    fill_in 'Formação', with: 'Ensino Superior'
    fill_in 'Descrição', with: 'Uma descrição'
    fill_in 'Experiência', with: 'Uma Experiência' 
    attach_file('Foto', 'home/fabio_ iwao/job-site/app/assets/images/blank-profile-picture-973460_640')
    click_on 'Enviar'
    
    expect(current_path).to eq profile_path(Profile.last.id)
    expect(page).to have_content('Fabio Iwao Oya')
    expect(page).to have_content('Joao')
    expect(page).to have_content('03/08/1993')
    expect(page).to have_content('Ensino Superior')
    expect(page).to have_content('Uma descrição')
    expect(page).to have_content('Uma Experiência')
    expect(page).to have_content('#photo')

  end
end
