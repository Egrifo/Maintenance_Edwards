Rails.application.routes.draw do
  resources :equipment
  resources :cells
  root to: 'main#home'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
