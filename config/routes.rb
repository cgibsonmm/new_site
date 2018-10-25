Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :forum_posts
      resources :forum_threads

      root to: "users#index"
    end
  devise_for :users

  resources :forum_threads do
    resources :forum_posts, module: :forum_threads
  end

  root "home#index"
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
