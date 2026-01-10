Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :main, only: [ :index, :create ]
  post "main/index", to: "main#create"
  get "main/history", to: "main#history"
  get "main/edit_history", to: "main#edit_history"
  post "main/add_history", to: "main#add_history", as: :main_add_history
  post "main/delete_history", to: "main#delete_history", as: :main_delete_history
  post "main/translation_delete", to: "main#translation_delete", as: :main_translation_delete
  get "guide", to: "main#guide"
  root "main#index"
  get "faq", to: "static_pages#faq"
  get "terms", to: "static_pages#terms"
  get "privacy", to: "static_pages#privacy"

  resources :contacts, only: [ :new, :create ]
  get "contact", to: "contacts#new"
  post "contact", to: "contacts#create"

  resources :users, only: %i[new create]
  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  get "logout", to: "user_sessions#destroy"
  delete "logout", to: "user_sessions#destroy"

  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  resources :generators, only: %i[create]
  get "generators/auto_emoji", to: "generators#auto_emoji"
  post "generators/auto_emoji", to: "generators#create"
  get "generators/auto_kansai", to: "generators#auto_kansai"
  post "generators/auto_kansai", to: "generators#create"
  get "generators/auto_both", to: "generators#auto_both"
  post "generators/auto_both", to: "generators#create"

  resources :templates, only: [] do
    collection do
      get  :emoji_template   # /templates/emoji_template
      get  :list   # ajaxで一覧HTML返す用（名前は好きに変えてOK）
    end
  end


  mount LetterOpenerWeb::Engine, at: "/letter_opener_web" if Rails.env.development?
end
