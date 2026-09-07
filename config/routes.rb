Rails.application.routes.draw do
   namespace :admin do
   resource :session, only: [:new, :create, :destroy]
   get 'dashboards', to: 'dashboards#index'
   resources :users, only: [:destroy]
  end

  scope module: :public do
    resource :session, only: [:new, :create, :destroy]
    resources :passwords, param: :token
    get "sign_up", to: "users#new"

    root to: 'homes#top'
    get 'homes/about', to: 'homes#about', as: :about

    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  
  resources :users, only: [:new, :create, :show, :edit, :update] , path_names: { new: 'sign_up' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
 
  end
   get "up" => "rails/health#show", as: :rails_health_check
end
