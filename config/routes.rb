Rails.application.routes.draw do
  scope path_names: { new: "novo", edit: "editar" } do
    resources :project_tags, path: "projeto_tags"
    resources :task_cells, path: "tarefas_celulas"
    resources :task_boards, path: "tarefas_diretorias"
    resources :goal_cells, path: "meta_celulas"
    resources :goal_boards, path: "meta_diretorias"
    get "/users/new", to: "users#new"
    post "/users", to: "users#create"
    devise_for :users
    root to:  "users#index"
    
    get "/artigos", to: "posts#articles", as: "articles"
    get "/artigos/novo", to: "posts#new_article", as: "new_article"
    get "/forum", to: "posts#forum"
    get "/tópico/novo", to: "posts#new_question", as: "new_question"
    
    resources :posts, path: "publicações" do
      resources :dislikes, path: "dislikes"
      resources :likes, path: "likes"
    end
    mount Commontator::Engine => '/commontator'
    resources :post_tags, path: "publicacoes_tags"
    resources :fusions, path: "fusoes"
    resources :project_users, path: "projeto_usuarios"
    resources :users, path: "usuarios"
    resources :boards, path: "diretorias"
    resources :cells, path: "celulas"
    resources :projects, path: "projetos"
    resources :tags, path: "tags"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
