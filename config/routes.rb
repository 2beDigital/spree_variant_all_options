Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :products do
      resources :variants do
        collection do
          get :create_all
          get :remove_all
          #get :vprice_all
        end
      end
    end
  end
  # non-restful checkout stuff
  #get '/admin/products/:id/variants/create_all', :to => 'admin/variants#create_all', :as => :create_all_admin_product_variants
end

