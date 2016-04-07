Rails.application.routes.draw do
  devise_for :users
  resources :pics do
    member do
      put "like", to: "pics#upvote"
      put "unlike", to: "pics#downvote"
    end
  end
  root 'pics#index'
end
