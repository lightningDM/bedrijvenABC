Bedrijvenabc::Application.routes.draw do

  devise_for :companies

 controller :payment do
   get 'payment'=>:new
   post 'payment'=>:create
 end



 	get "contact/index"
	match "contact" => "contact#index", :as => :contact

 	
	get "search/index"
	match "search" => "search#index", :as => :search
	
	get "companies/search_by_name"
	match "/companies/search_by_name" => "companies#search_by_name", :as => :search_by_name

	get "companies/search_by_nummer"
	match "/companies/search_by_nummer" => "companies#search_by_nummer", :as => :search_by_nummer

 	get "home/index"

	
	get "sectors/index"
	match "sectors" => "sectors#index", :as => :sectors

	get  "regios/index"
	match "regios" => "regios#index", :as => :regios


  resources :companies
  resources :regios
  resources :sectors

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
  # root :to => "welcome#index"
	root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
