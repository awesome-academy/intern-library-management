Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "adminpages#home"
      resources :users, only: %i(index destroy)
      resources :books, only: :index
      resources :categories do
        resources :books
      end
      resources :authors
      resources :publisher
    end
    root "homepages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
