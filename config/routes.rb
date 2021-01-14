Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi/ do
    namespace :admin do
      root "adminpages#home"
      resources :users, only: %i(index destroy)
      resources :publishers
      resources :books, only: %i(index new create)
      resources :categories do
        resources :books, except: %i(new create)
      end
      resources :authors
    end
    resources :books, only: :show
    resources :borrow_items, only: %i(index create destroy)
    resources :borrowings, only: %i(index create)

    root "homepages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    post "/add_book_to_session", to: "borrow_items#insert_book_to_session"
  end
end
