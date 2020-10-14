Rails.application.routes.draw do
  resources :courses
  resources :lectures
  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks",
  registrations: 'users/registrations'
 }
  post 'update_user/:id' => "home#update_user"
  get 'all_users' => "home#all_users"
  get 'edit_user/:id' => "home#edit_user"

  root 'home#top'
  get 'home/about'
  get 'home/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
