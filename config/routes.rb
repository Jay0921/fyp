Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, except: [:show] do
    resources :appointments
    resources :requests
  end
  resources :subjects, except: [:show]
  resources :profiles, except: [:show]
  resources :tutors do
    member do
      get :appointment
    end
  end
  resources :comments
end
