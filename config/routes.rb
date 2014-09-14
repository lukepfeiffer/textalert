TextAlert::Application.routes.draw do
  root 'pages#home'

  resources :events
end
