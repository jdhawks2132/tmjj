Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users

  authenticate :user, lambda { |u| u.superadmin? } do
    namespace :admin do
      get 'dashboard', to: 'dashboard#dashboard'
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
