Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :main, only: [ :index, :create ]
  post "main/index", to: "main#create"

  get "templates", to: "main#templates"
  get "guide", to: "main#guide"
  root "main#index"

  resources :users, only: %i[new create]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
end
