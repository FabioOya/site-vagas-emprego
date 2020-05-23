Rails.application.routes.draw do
  devise_for :candidates
  devise_for :head_hunters
  root 'home#index'
  resources :jobs, only: [:index, :show, :new, :create] do
    get 'search', on: :collection
    get 'candidates_applied', on: :member
    resources :apply_jobs, only: [:index, :new, :create]
  end
  resources :profiles do
    get 'appliedjobs', on: :collection
  end

end
