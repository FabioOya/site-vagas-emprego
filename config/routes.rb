Rails.application.routes.draw do
  devise_for :candidates
  devise_for :head_hunters
  root 'home#index'
  resources :jobs, only: [:index, :show, :new, :create] do
    resources :proposals, only: [:new, :create]
    get 'search', on: :collection
    get 'candidates_applied', on: :member
    resources :apply_jobs, only: [:index, :show, :new, :create] do
      get 'reject', on: :member #post
      get 'feedback', on: :collection
    end 
  end
  resources :profiles, only: [:index, :show, :new, :create, :edit, :update] do
    get 'featured', on: :member
    get 'appliedjobs', on: :collection
    resources :commentaries, only: [:create]
  end

end
