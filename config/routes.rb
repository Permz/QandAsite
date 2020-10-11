Rails.application.routes.draw do

  root to: "home#top"
  get '/' => 'home#top'
  get 'users/show'

  resources :news
  resources :contacts
  resources :questions
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
end
