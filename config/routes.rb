Rails.application.routes.draw do
  root to: 'games#new'
  resources :games do
    resources :rooms, only: ['show']
  end
  resources :guesses, only: ['create']
  resources :accusations, only: ['create']
end
