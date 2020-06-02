# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
candidate = Candidate.create(email:'candidate@candidate.com', password: '12345678')
candidate2 = Candidate.create(email:'anothercandidate@candidate.com', password: '12345678')
head_hunter = HeadHunter.create(email:'headhunter@headhunter.com', password: '12345678')]
another_head_hunter = HeadHunter.create(email: 'anotherheadhunter@headhunter.com', password: '12345678')


job = Job.create(title: 'Desenvolvedor', description: 'desenvolver apps', 
          skills: 'js, ror, python edtc', salary: 30000, 
          job_level: 'Estagiário', end_date: '01/01/2050',  
          location: 'Paulista', email:head_hunter.email) 

job2 = Job.create(title: 'Caçador', description: 'caçar', 
          skills: 'Saber caçar', salary: 50000, 
          end_date: '01/01/2020', location: 'Selva', 
          job_level: 'Especialista', email:another_head_hunter.email)


profile = Profile.create(name: 'nome',   
                    social_name:'um nome',
                    birthdate: '05/05/2005',
                    formation: 'caçador', 
                    description: 'descriçao',
                    experience: 'experience',
                    candidate: candidate,
                    email: candidate.email,
                    featured: 0)


profile2 = Profile.create(name: 'nome2',   
                    social_name:'outro nome',
                    birthdate: '03/03/2003',
                    formation: 'Desenvolvedor', 
                    description: 'Outra descricao',
                    experience: 'Experiencia',
                    candidate: candidate2,
                    email: candidate2.email,
                    featured: 0)

apply_job = ApplyJob.create(job: job, profile: profile,
                            reason:'Razao', reject_feedback: 'Feedback')
                
apply_job2 = ApplyJob.create(job: job2, profile: profile2,
                            reason:'Razao', reject_feedback: 'Feedback!')

commentary = Commentary.create(text: 'comentario', head_hunter: head_hunter, 
                               profile: profile)