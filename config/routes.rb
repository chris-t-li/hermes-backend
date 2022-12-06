Rails.application.routes.draw do
  # resources :contacts, except: [:show]
  # resources :participants
  resources :conversations
  resources :messages, only: [:create, :destroy]
  # # resources :users

  get "/me", to: "sessions#show"
  patch "/me", to: "users#update"
  post "/signup", to: "users#create"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get '/myconversations', to: 'sessions#show_my_convos'
  get "/mycontacts", to: 'sessions#show_my_contacts'
end
