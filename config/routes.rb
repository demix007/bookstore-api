Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  Rails.application.routes.draw do
    namespace :api do
      namespace :v1 do
        resources :categories, only: %i[index create destroy]
        resources :books, only: %i[index create show update destroy]
      end
    end
   end
end
