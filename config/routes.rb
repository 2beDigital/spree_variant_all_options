Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :products do
      resources :variants do
        collection do
          get :create_all
          get :remove_all
          get :vprice_all
        end
      end
    end
  end
#  match "/admin/products/:id/variants/create_all" => "admin/variants#create_all"
end

