Rails.application.routes.draw do

  root 'home#index'

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'auth/:provider/callback', to: 'google_auth#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'google_auth#destroy', as: 'signout'


  resources :home, only: [:index]
  resource  :session, :controller => 'sessions', :only => [:new, :create, :destroy]
  resources :users, only: [:show]
  resources :categories, only: [:show, :index] do
    resources :documents, only: [:index, :show]
  end
  resources :documents, only: :index
  resources :plans, only: :index
  resources :subscriptions, only: [:index, :update, :create]
  resources :receipts, only: [:show]
  resources :payment_callbacks, only: :create
  resources :downloads, only: :show

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]


end
