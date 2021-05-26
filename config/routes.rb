Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, except: [:show]
  resources :subjects, except: [:show]
  resources :profiles, except: [:show]
  resources :tutors
end
