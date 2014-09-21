TextAlert::Application.routes.draw do
  root 'users#home'

  resources :users
  resources :events

  post 'sessions', to: 'sessions#create'

  delete 'sign_out', to: 'sessions#destroy'
end
