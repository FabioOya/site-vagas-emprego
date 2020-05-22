require 'rails_helper'

feature 'Candidate searchs for job ' do
  scenario 'by title' do
    candidate = create(:candidate)
    job = create(:job, title: 'Desenvolvedor')
    
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: 'Desenvolvedor'
    click_on 'Buscar'

    expect(page).to have_content('Desenvolvedor')
  
  end

  scenario 'by description' do
    candidate = create(:candidate)
    job = create(:job)
    
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    fill_in 'Busca', with: 'Descrição vaga emprego'
    click_on 'Buscar'

    expect(page).to have_content('Descrição vaga emprego')
  
  end

end 