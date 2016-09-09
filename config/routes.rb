Rails.application.routes.draw do

  ################### account ##############################
  get 'account_new/:patient_id' => 'account#new'
  post '/create' => 'account#create'
  get '/accounts' => 'account#list'
  get '/clients' => 'account#clients'
  get 'account/:patient_id' => 'account#details'
  get '/fetch_account_number' => 'account#fetch_account_number'
  ##########################################################

  ################### insurance_cover ##############################
  get '/insurances' => 'insurance_cover#index'
  get 'company/:insurance_id' => 'insurance_cover#new_company'
  post '/update_insurance' => 'insurance_cover#update_insurance'
  get 'add_insurance_plan/:insurance_id' => 'insurance_cover#add_insurance_plan'
  post 'add_insurance_plan' => 'insurance_cover#add_insurance_plan'
  get 'edit_insurance_plan/:insurance_plan_id' => 'insurance_cover#edit_insurance_plan'
  post '/edit_insurance_plan' => 'insurance_cover#edit_insurance_plan'
  get 'fetch_insurance_covers/:insurance_id' => 'insurance_cover#fetch_insurance_covers'
  ###################################################################

  ################### hospital services ##############################
  get '/services' => 'services#index'
  ####################################################################

  ################### USER ##############################
  get '/login' => "user#login"
  post '/login' => "user#login"
  get '/logout' => "user#logout"
  ######################################################


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
  root :to => "home#index"
end
