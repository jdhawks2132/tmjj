Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users

  resources :events do
    member do
      post 'add_participant'
      delete 'remove_participant'
    end
  end

  authenticate :user, lambda { |u| u.superadmin? } do
    namespace :admin do
      get 'dashboard', to: 'dashboard#dashboard'

      resources :groups do
        resources :memberships, only: [:create, :destroy]
      end

      resources :users, only: [:edit, :update]  # If you decide to allow editing users from admin dashboard
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
