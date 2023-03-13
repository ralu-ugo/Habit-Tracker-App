Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
    resources :habits do
      resources :habit_slots, only: [ :show, :new, :create,:edit, :update ]
    end
  resources :habit_slots, only: [:destroy]

  get "/dashboard", to: "pages#dashboard"

  patch '/habits/favourite/:id', to: 'habits#favourite'

  get "/setting", to: "pages#setting"

  get "/schedule_today/:date", to: "pages#schedule_today", as: "schedule_today"
  get "/calendar", to: "pages#calendar", as: "calendar"
  get "/progress_page", to: "pages#progress_page", as: "progress_page"
end
