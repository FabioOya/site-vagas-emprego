Rails.application.routes.draw do
  devise_for :candidates
  devise_for :head_hunters
  root 'home#index'
  resources :jobs do
    get 'search', on: :collection
  end
  resources :profiles
end
