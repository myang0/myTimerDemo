Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'sessions#new'

  get '/welcome' => 'welcome#index'

  get 'signup' => 'users#new'
  resources :users

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/timer' => 'records#new'
  post 'timer' => 'records#create'

  get '/stats' => 'records#index'
  get '/stats/year' => 'records#index'
  get '/stats/month' => 'records#index'
  get '/stats/week' => 'records#index'
  get '/stats/day' => 'records#index'
  resources :records

end
