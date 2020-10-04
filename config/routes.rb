Rails.application.routes.draw do
  root to: "home#top"
  get '/' => 'home#top'
  
  devise_for :users
end
