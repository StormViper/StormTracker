Rails.application.routes.draw do
  devise_for :users,
              :controllers => { :registrations => "member/registrations" }
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

  scope module: 'public' do
    root 'dashboard#welcome'
  end

  scope module: 'admin' do
    get '/admin/dashboard', to: 'dashboard#admin'
    get '/admin/dashboard/users', to: 'dashboard#users'
  end
  scope module: 'member' do
    get '/dashboard', to: 'dashboard#home'
    get '/users/signup', to: 'registrations#new'
    post '/users/signup', to: 'registrations#create'
    get '/users/me', to: 'dashboard#get_user'

    get '/expense/new/company', to: 'expense#index'
    get '/expense/new', to: 'expense#new'
    post '/expense/create', to: 'expense#create'

    get '/expense/new/comp', to: 'expense#new_comp'
    post '/expense/create/comp', to: 'expense#create_with_comp'
    get '/expense/edit', to: 'expense#edit'
    post '/expense/update', to: 'expense#update'
    get '/redirect/expenseselect', to: 'expense#redirect_select'

    get '/users/settings', to: 'settings#home'
  end

  scope module: 'upgrade' do
   get '/upgrade', to: 'dashboard#upgrade'
  end

  scope module: 'company' do
    get '/mycompany', to: 'dashboard#index'
    get '/mycompany/users', to: 'dashboard#user'

    get '/mycompany/branch', to: 'branch#index'
    post '/mycompany/expense/new', to: 'branch#new_expense'
  end
end
