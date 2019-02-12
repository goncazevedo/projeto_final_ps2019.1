Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :post_tags
  resources :posts
  resources :fusions
  resources :project_users
  resources :users
  resources :tasks
  resources :goals
  resources :boards
  resources :cells
  resources :projects
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
