Rails.application.routes.draw do
  resources :contacts
  resources :slides
  resources :lecture_users
  resources :sheet_links
  resources :courses
  resources :lectures
  resources :charges

  #resource :passwords, only: [:create]

  devise_for :users, controllers: {
  omniauth_callbacks: "users/omniauth_callbacks",
  registrations: 'users/registrations',
  sessions: 'users/sessions',
  passwords: 'users/passwords'
 }
  post "/unsubscribe" =>"charges#unsubscribe"
  post 'update_user/:id' => "home#update_user"
  post "lectures/complete/:course_id/:order" => "lectures#complete"
  get 'all_users' => "home#all_users"
  get 'edit_user/:id' => "home#edit_user"
  root 'home#top'
  get 'home/about'
  get 'home/contact'
  get '/mycourse' => 'home#mycourse'
  get '/free_trial' => 'home#free_trial'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
