Rails.application.routes.draw do

  root to: "home#top"
  get '/' => 'home#top'
  get 'users/show'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end
