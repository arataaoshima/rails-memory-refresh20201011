Rails.application.routes.draw do
  resources :blog_categories
  resources :blogs
  resources :privacy_policies
  resources :policies
  resources :categories
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
  post '/delete_user/:id' => 'home#delete_user'
  get '/course_table' => 'home#course_table'
  get '/category_table' => 'home#category_table'
  get '/current_studies' => 'home#current_studies'
  get '/current_studies_courses/:id' => 'home#current_studies_courses'
  get '/home/policies' => 'home#policies'
  get '/home/privacy_policies' => 'home#privacy_policies'

  get '/sitemap', to: redirect("https://futurework-arata.s3-us-west-2.amazonaws.com/sitemaps/sitemap.xml.gz")
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'
end
