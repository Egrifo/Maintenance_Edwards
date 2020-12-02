Rails.application.routes.draw do

  root to: 'main#home'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get 'angular-items', to: 'portfolios#angular'
  #get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'main#about'
  get 'contact', to: 'main#contact'
  #get 'tech-news', to: 'pages#tech_news'

end
