Rails.application.routes.draw do

  resources :tasks
  resources :equipment
  resources :cells
  resources :maintenances
  resources :services, except: [:show]
  root to: 'main#home'
    get "services", to:"services#index", as: "dashboard"
  resources :transactions, only: [:show, :create, :new, :index]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
