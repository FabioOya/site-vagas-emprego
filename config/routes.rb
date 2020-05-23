Rails.application.routes.draw do
  devise_for :candidates
  devise_for :head_hunters
  root 'home#index'
  resources :jobs, only: [:index, :show, :new, :create] do
    get 'search', on: :collection
    resources :apply_jobs, only: [:new, :create]
  end
  resources :profiles

end
