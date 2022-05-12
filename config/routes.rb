Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root 'static_pages#top'

  get 'search', to: 'searches#search'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  resources :name_diagonses, only: %i[new show]
end
