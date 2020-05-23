require 'rails_helper'

feature 'Candidate apply to job' do
  scenario 'succesfully' do
    candidate = create(:candidate)
    profile = create(:profile, candidate_id: candidate.id)
    job = create(:job)
    
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    within("dt#job-#{job.id}") do
      click_on 'Ver Detalhes'
    end
    click_on 'Candidatar-se'
    
    fill_in 'Razões para candidatar-se', with: 'Uma razão'

    click_on 'Enviar'
    expect(page).to have_content('Você se candidatou para a vaga')
  end

  scenario 'and he already applied to that job' do
    candidate = create(:candidate)
    profile = create(:profile, candidate_id: candidate.id)
    job = create(:job)
    
    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    within("dt#job-#{job.id}") do
      click_on 'Ver Detalhes'
    end
    click_on 'Candidatar-se'

    fill_in 'Razões para candidatar-se', with: 'Uma razão'
    click_on 'Enviar'

    within("dt#job-#{job.id}") do
      click_on 'Ver Detalhes'
    end

    click_on 'Candidatar-se'

    expect(page).to have_content('Você já esta candidatado para esta vaga')
  end

  scenario 'and can view all applied jobs' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)
    job = create(:job)
    another_job = create(:job)

    login_as candidate, scope: :candidate

    visit root_path
    click_on 'Vagas'
    within("dt#job-#{job.id}") do
      click_on 'Ver Detalhes'
    end
    click_on 'Candidatar-se'
    fill_in 'Razões para candidatar-se', with: 'Uma razão'
    click_on 'Enviar'

    expect(page).to have_content('Você se candidatou para a vaga')

    within("dt#job-#{another_job.id}") do
      click_on 'Ver Detalhes'
    end
    click_on 'Candidatar-se'
    fill_in 'Razões para candidatar-se', with: 'Uma razão'
    click_on 'Enviar'

    expect(page).to have_content('Você se candidatou para a vaga')

    visit root_path
    click_on 'Vagas aplicadas'

    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)

  end
end