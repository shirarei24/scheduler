Rails.application.routes.draw do
  #get 'calendar/new' => 'events#new', :as => :event
  post 'event/create' => 'events#create', :as => :event
  patch'event/create' => 'events#create'
  get  'event/create' => 'events#create'
  post 'calendar/new' => 'events#new'
  post 'calendar/todoupdate' => 'calendar#todoupdate'
  post 'calendar/todocreate' => 'calendar#todocreate'

  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  #post '/calendar(/:year(/:month))' => 'calendar#index', :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  get '/calendar/index/:id(/:year(/:month))' => 'calendar#index'
  #post '/calendar/index/:id(/:year(/:month))' => 'calendar#index'

  get '/events/delete/' => 'events#delete'
  patch '/calendar/update' => 'calendar#update'
  patch 'calendar/todo' => 'calendar#todo'
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
