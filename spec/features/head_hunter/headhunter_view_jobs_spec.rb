require 'rails_helper'

feature 'Headhunter view all jobs' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    job = create(:job, head_hunter: headhunter)
    another_job = create(:job, head_hunter: headhunter)
  
    login_as headhunter, scope: :head_hunter

    visit root_path
    click_on 'Vagas'

    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)
    
  end
  scenario 'view only his jobs' do
    headhunter = create(:head_hunter)
    another_headhunter = create(:head_hunter)
    job = create(:job, head_hunter: headhunter)
    another_job = create(:job, head_hunter: headhunter)
    job1 = create(:job, head_hunter: another_headhunter)
    job2 = create(:job, head_hunter: another_headhunter)
    
    login_as headhunter, scope: :head_hunter
    
    visit root_path
    click_on 'Vagas'

    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)
    
    expect(page).not_to have_content(job1.title)
    expect(page).not_to have_content(job1.title)

  end
  

end