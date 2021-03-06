NibIo::Application.routes.draw do
  root :to => "home#index"

  # :as => 'signin' ensures we have functions: path_to_signin, url_to_signin available
  get '/signin', :to => 'sessions#new'
  get '/signout', :to => 'sessions#destroy'
  get '/signup', :to => 'users#new'

  resources :sessions

  resources :books do
    member do
      get :subscribers
      get :fans
    end
    resources :sections
  end


  # by default it will be curent user
  # get '/readings' => 'users#readings'
  # get '/writings' => 'users#writings'
  # get '/likes' => 'users#likes'

  # user resources, readings and writings
  resources :users do
    member do
      # only for retrieve the categoriesed books of the specific users
      get :likes, :as => :likes
      get :readings, :as => :readings
      get :writings, :as => :writings
    end
  end

  resources :favourites
  resources :authorings
  resources :subscriptions


  # TODO: display interested books according to user's likes and reading
  # match '/users/:id' => 'books#index'










  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
