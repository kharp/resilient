
Rails.application.routes.draw do
  
Athingwithfeathers::Application.routes.draw do

  mount RailsAdmin::Engine => '/dashboard', as: 'rails_admin'
  resources :channels do
    resources :pins
  end

  get "/pins/:id/repost" => "pins#repin_new", as: 'repin_new'
  post "/pins/:id/repost" => "pins#repin_create", as: 'repin_create'

  devise_for :users

  root "pages#_home"
  get "about" => "pages#about"
  get "love" => "pages#love"
  get "resources" => "pages#resources"
  get "goal-setting-prompts" => "pages#goal-setting-prompts"
  get "heal-with-forgiveness" => "pages#heal-with-forgiveness"
  get "how-to-figure-out-what-you-want" => "pages#how-to-figure-out-what-you-want"
  get "drop-out-of-school" => "pages#drop-out-of-school"
  get "recommended-reading" => "pages#recommended-reading"
  get "self-sabotage" => "pages#self-sabotage"
  get "negativity-detox" => "pages#negativity-detox"
  get "negativity-detox-success" => "pages#negativity-detox-success"
  get "forem/base"
  get "/sign_up"   => "devise/registrations#new"
  get "thank-you" => "pages#thank-you"

  # My Channels
  resources :users
  #get '/users/:id' => 'users#show'

  #mount Commontator::Engine => '/commontator'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  end
end