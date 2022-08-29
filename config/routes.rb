Rails.application.routes.draw do
  get 'site/', to: "site#index", as: :root_page
  get 'dashboards/index', as: :dashboards
  resources :registrations, only: %i[ new create ]
  resources :logins, only: %i[ new create ]
  resources :posts
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "site#index"
end
