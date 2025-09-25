Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :main, only: [ :index, :create ]
  get "main/index"

  # Defines the root path route ("/")
  get "templates", to: "main#templates"
  get "guide", to: "main#guide"
  get "welcome", to: "rails/welcome#index"
  root "main#index"
  post "/convert", to: "main#convert"
end
