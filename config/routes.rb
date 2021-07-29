Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  #devise_for :users
  #get 'home/index'

   root "home#index"
  #get 'home', to: "home#index"

  #root "home#pruebas"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
end
