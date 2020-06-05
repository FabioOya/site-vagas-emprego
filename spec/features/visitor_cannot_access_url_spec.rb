require 'rails_helper'

feature 'Visitor cannot access through urls' do
  scenario 'profile' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)

    visit "/profiles/1"
    
    expect(current_path).to eq(root_path)
  end

  scenario 'profiles' do
    visit profiles_path
    
    expect(current_path).to eq(root_path)
  end

  scenario 'profiles new' do
    visit new_profile_path
    
    expect(current_path).to eq(root_path)
  end

  scenario 'edit profile' do
    candidate = create(:candidate)
    profile = create(:profile, candidate: candidate)

    visit "profiles/1/edit"

    expect(current_path).to eq(root_path)
  end

  scenario 'job' do
    headhunter = create(:head_hunter)
    job = create(:job, head_hunter: headhunter)

    visit "/jobs/1"
    
    expect(current_path).to eq(root_path)
  end

  scenario 'jobs' do
    visit jobs_path
    
    expect(current_path).to eq(root_path)
  end

  scenario 'jobs new' do
    visit new_job_path
    
    expect(current_path).to eq(root_path)
  end
end