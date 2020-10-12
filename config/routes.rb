Rails.application.routes.draw do
  resources :courses
  resources :lectures
  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks"
 }
  root 'home#top'
  get 'home/about'
  get 'home/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
