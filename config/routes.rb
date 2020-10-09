Rails.application.routes.draw do

  resources :contacts
  resources :questions
  root to: "home#top"
  get '/' => 'home#top'
  get 'users/show'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
end
