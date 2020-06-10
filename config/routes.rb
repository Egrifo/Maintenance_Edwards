Rails.application.routes.draw do
  resources :tasks
  resources :equipment
  resources :maintenances
  resources :cells
  resources :services, except: [:show]
  get "services", to:"services#index", as: "dashboard"
  #resources :store
  resources :appliances

  resources :transactions, only: [:show, :create, :new, :index]
  root to: 'main#home'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
