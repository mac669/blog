Rails.application.routes.draw do
  #get 'home/index'
  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
end
