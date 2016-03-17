Rails.application.routes.draw do
  get 'welcome/index'
  
  #specify default root page
  root 'welcome#index'
end
