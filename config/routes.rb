Rails.application.routes.draw do
    # get 'products', to: "products#index"
    # get 'products/new', to: "products#new", as: :new_product
    # get 'products/search', to: 'products#search', as: :search_products

    # get 'products/:id', to: "products#show"
    # get 'products/:id/edit', to: "products#edit", as: :edit_product

    # post 'products', to: "products#create"
    # patch 'products/:id', to: 'products#update', as: :product
    
    resources :categories
    resources :products do 
        get 'search', on: :collection 
        resources 'comments', only: [:create]
        resources 'votes', only: [:create]
    end

    root "welcome#index"
end
