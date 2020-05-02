Rails.application.routes.draw do
  devise_for :users,
  controllers: { registrations: 'registrations' }
  root 'pages#home'
  resources :lessons, only: %I[index]
  resources :users, only: %i[show]
end
