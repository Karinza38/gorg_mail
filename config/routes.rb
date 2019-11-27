Rails.application.routes.draw do

  get 'unsubscribe', to: "unsubscribe#email_form"
  post 'unsubscribe', to: "unsubscribe#send_verification_email"
  get 'unsubscribe/:token', to: "unsubscribe#ml_form", as: :unsubscribe_token
  post 'unsubscribe/:token', to: "unsubscribe#process_unsubscribe"

  namespace :ml do
    resources :external_emails
  end
  namespace :ml do
    get 'lists/invitations/:token', to: 'external_invitation#accept_invitation', as: :accept_external_invitation
    post 'lists/invitations/:token', to: 'external_invitation#accept_cgu'

    resources :lists do
      #ToDo Mettre les routes suivante dans un member do

      get "sync_with_google"
      get "join/:user_id", to: "lists#join", as: :join
      get "leave/:user_id", to: "lists#leave", as: :leave
      post "add_email", to: "lists#add_email", as: :add_email
      delete "remove_email", to: "lists#remove_email", as: :remove_email


      resource :users do
        #post "set_role/:user_id", to: "lists#set_role", as: :set_role
        get "set_role/:user_id", to: "lists#set_role", as: :set_role
      end
    end
  end
  get 'admin/index'

  resources :aliases
  resources :postfix_blacklists, path: :blacklist, except: [:show]
  resources :email_virtual_domains, path: :domains, except: [:show]
  
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks",
    :sessions => "users/sessions",
    masquerades: "admin/masquerades"
    }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#landing'

  get 'setup' => 'setup#index'
  get 'setup/finish' => 'setup#finish'
  post 'setup' => 'setup#setup'

  get 'admin' => 'admin#index'
  get 'admin/search_email' => 'admin#search_email'
  get 'roles' => 'roles#index'
  get 'dashboard' => 'users#dashboard'
  get 'mailinglists' => 'users#dashboard_ml'

  resources :users, constraints: { id: /[^\/]+/ } do

    resources :roles, only: [:create,:destroy]

    get :autocomplete_user_hruid, :on => :collection
    get :search_by_id, :on => :collection
    get :sync, to: 'users#sync_with_gram', on: :member

    member do
      get :dashboard
      get :dashboard_ml
      get :create_google_apps
      get :confirm_google_apps
    end

    resources :email_source_accounts, only: [:index, :show, :create,:update,:destroy] do
      get :set_as_primary
    end
    
    resources :email_redirect_accounts, only: [:index, :show, :create,:update,:destroy] do
      # get :flag
      get "flag/:flag", to: "email_redirect_accounts#flag", as: :flag, defaults: { format: 'js' }
      collection do
        get "confirm/:token", to: "email_redirect_accounts#confirm", as: :confirm
        # get "flag/:flag", to: "email_redirect_accounts#flag", as: :flag
      end
    end

  end

  namespace :api, :defaults => {:format => :json} do
    get '/search/:query', to: 'search#search', as: :search, :query => /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i
  end

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
