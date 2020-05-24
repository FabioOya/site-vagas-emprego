require 'rails_helper'

feature 'Headhunter rejects candidate with feedback' do
  scenario 'successfully' do
    headhunter = create(:head_hunter)
    candidate = create(:candidate)
    job = create(:job, head_hunter: headhunter)

    login_as headhunter, scope: :head_hunter

    visit root_path
    click_on 'Vagas'
    click_on 'Detalhes'
    click_on 'Candidatos'
    click_on 'Rejeitar'


    expect(page).to have_content('Candidato rejeitado')
   
    fill_in 'Feedback', with: 'Você foi rejeitado para a vaga'
    click_on 'Enviar e rejeitar perfil'

    expect(current_path).to eq(headhunter_root_path)
    expect(page).to have_content('Mensagem enviada com sucesso!')
    expect(page).to have_content('Perfil rejeitado')
    expect(current_path).to eq(candidates_job_path(job))
  end
end 