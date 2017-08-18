Rails.application.routes.draw do


  
  get 'db_management'=>'db_management#index'

  get 'db_management/font_db'

  get 'db_management/category_db'

  post 'db_management/font_create'

  post 'db_management/category_create'

  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }
  
  resources :posts do
    resources :comments,  except: [:show] do
      post "/best", to: "posts#bestComment"
    end
  end
  
  # resources :management

  resources :comments
  root 'home#index'
  post '/posts/:post_id/comments/:comment_id/best' =>"posts#bestComment"
  get 'home/index'
  get '/donate' => 'home#donate'
  get '/' => 'home#index'
  get '/pick' => 'home#pick'
  get '/search_bar' => 'home#search_bar'
  get '/search_check' => 'home#search_check'
  get '/font_page/:font_id' => 'home#font_page'
  get 'register/info1'
  get 'register/info2' 
  post 'register/getEmail'
  post 'register/infoget'

  
  

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
