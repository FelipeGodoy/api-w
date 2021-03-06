Rails.application.routes.draw do
  root :to =>"rooms#index", defaults: {format: :json}
  get 'shots/reset' => 'games#reset_shots', defaults: {format: :json}
  get 'games/shots' => 'games#get_shots', defaults: {format: :json}
  post 'rooms/connect' => 'rooms#connect', defaults: {format: :json}
  post 'rooms/disconnect' => 'rooms#disconnect', defaults: {format: :json}
  post 'games/start' => 'games#start', defaults: {format: :json}
  post 'games/close' => 'games#close', defaults: {format: :json}
  post 'games/shots' => 'games#add_shot', defaults: {format: :json}
  post 'games/clear' => 'games#clear', defaults: {format: :json}
  resources :rooms,:except=>[:show] , defaults: {format: :json}
  resources :games, defaults: {format: :json}
  
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
