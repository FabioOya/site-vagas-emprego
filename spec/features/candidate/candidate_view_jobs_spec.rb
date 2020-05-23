require 'rails_helper'

feature 'candidate view jobs' do
  scenario 'sucessully' do

    candidate = create(:candidate)
    job = create(:job)
    job2 = create(:job)

    login_as candidate, scope: :candidate
    visit root_path
    click_on "Vagas"

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.job_level)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job2.description)
    expect(page).to have_content(job2.job_level)

  end

  scenario 'and view details' do
    candidate = create(:candidate)
    job = create(:job)
    job2 = create(:job, description: 'outra descrição', job_level: 'outro job level')

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'
    within("dt#job-#{job.id}") do
      click_on 'Ver Detalhes'
    end

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.job_level)
    expect(page).not_to have_content(job2.title)
    expect(page).not_to have_content(job2.description)
    expect(page).not_to have_content(job2.job_level)

  end

  scenario 'and no jobs r available' do
    candidate = create(:candidate)

    login_as candidate, scope: :candidate
    visit root_path
    click_on 'Vagas'

    expect(page).to have_content('Vagas de emprego')
    expect(page).to have_content('Nenhuma vaga disponível')
  end
end 