Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :questions do
    collection do
      post :generate_openai_text
    end
  end
  resources :products
  root "questions#index"
  resources :posts
end
