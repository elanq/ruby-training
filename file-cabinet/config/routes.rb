Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  
  #specify default root page
  root 'welcome#index'

  resources :docs
end
