Rails.application.routes.draw do
  root to: "home#top"
  get "/" => "home#top"
  get "/about" => "home#about"
  get "users/show"

  resources :news
  resources :contacts
  resources :questions do
    resources :comments
  end
  resources :categories

  devise_for :users, controllers: {
    sessions: "users/sessions",
  }

  # ゲストログイン機能
  devise_scope :user do
    post "users/guest" => "users/sessions#guest_login"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
