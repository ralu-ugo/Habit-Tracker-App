Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
  resources :calendars
  resources :habits do
    resources :daily_trackings, only: [ :new, :create, :edit, :update, :destroy ]
  end
end
