ProgramBrowser::Application.routes.draw do
  
  root  'programs#index'

  resources :programs do
    resources :subjects
  end

  resources :subjects

  post '/programs/file_contents'
  get '/programs/file_browse/:id', to: 'programs#file_browse'

  get '/subjects/file_browse/:id', to: 'subjects#file_browse'

  post '/subjects/:subject_id/program_files/:program_file_id', to: 'subjects#bind_program_file'
  delete '/subjects/:subject_id/program_files/:program_file_id', to: 'subjects#unbind_program_file'

  post '/memos', to: 'memos#create' 
  patch '/memos', to: 'memos#update'
  delete '/memos', to: 'memos#destroy' 

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
