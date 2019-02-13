Rails.application.routes.draw do
  resources :task_cells
  resources :task_boards
  resources :goal_cells
  resources :goal_boards
  devise_for :users
  root to:  "users#index"
  resources :posts do
    resources :dislikes
    resources :likes
  end
  mount Commontator::Engine => '/commontator'
  resources :post_tags
  resources :fusions
  resources :project_users
  resources :users
  resources :boards
  resources :cells
  resources :projects
  resources :tags
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
