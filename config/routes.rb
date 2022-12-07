Rails.application.routes.draw do
  resources :contacts
  # resources :participants
  resources :conversations
  resources :messages, only: [:create, :update, :destroy]
  resources :users, only: [:index]

  get "/me", to: "sessions#show"
  patch "/me", to: "users#update"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/myconversations', to: 'sessions#show_my_convos'
  get "/mycontacts", to: 'sessions#show_my_contacts'
end
