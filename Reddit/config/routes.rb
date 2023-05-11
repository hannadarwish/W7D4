Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:create, :new]
  resources :posts, except: [:index, :destroy]
  resources :subs, except: [:destroy]
  resource :session, only: [:create, :new, :destroy]
end
