Rails.application.routes.draw do
  
mount Ckeditor::Engine => '/ckeditor'
mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'

Athingwithfeathers::Application.routes.draw do

  #mount Ckeditor::Engine => '/ckeditor'
  resources :channels do
    resources :pins
  end

  get "/pins/:id/repost" => "pins#repin_new", as: 'repin_new'
  post "/pins/:id/repost" => "pins#repin_create", as: 'repin_create'

  get "/users/:id/block_user" => "users#block_user_new", as: 'block_user_new'
  post "/users/:id/block_user" => "users#block_user_create", as: 'block_user_create'


  devise_for :users,  controllers: { registrations: "users/registrations" }

  root "pages#_home"
  get "about" => "pages#about"
  get "love" => "pages#love"
  get "goal-setting-prompts" => "pages#goal-setting-prompts"
  get "heal-with-forgiveness" => "pages#heal-with-forgiveness"
  get "how-to-figure-out-what-you-want" => "pages#how-to-figure-out-what-you-want"
  get "drop-out-of-school" => "pages#drop-out-of-school"
  get "recommended-reading" => "pages#recommended-reading"
  get "self-sabotage" => "pages#self-sabotage"
  get "negativity-detox" => "pages#negativity-detox"
  get "figure-out-your-life" => "pages#figure-out-your-life"
  get "negativity-detox-success" => "pages#negativity-detox-success"
  get "foyl-success" => "pages#foyl-success"
  get "/sign_up"   => "devise/registrations#new"
  get "/privacy-policy"   => "pages#privacy-policy"
  get "thank-you" => "pages#thank-you", as: :thank_you
  
  # My Channels
  resources :users
  #get '/users/:id' => 'users#show'

  #mount Commontator::Engine => '/commontator'
  
  get "resources", to: "resources#resources"
  resources :articles, only: [:index, :show]
  resources :courses, only: [:index, :show]

end
end
