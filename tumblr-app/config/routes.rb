Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resource :comments
  end
  root 'posts#index'
  # static page
  get '/about',to: 'pages#about'
end
