Rails.application.routes.draw do

  root to: "home#top"
  get '/' => 'home#top'
  get 'users/show'

  resources :news
  resources :contacts
  resources :questions do
    resources :comments, only: [:create]
  end
  resources :categories
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
end
