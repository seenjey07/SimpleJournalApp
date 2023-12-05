Rails.application.routes.draw do

  resources :users, only: [:new, :create], path_names: { new: 'signup' }
  resources :sessions, only: [:new, :create, :destroy], path_names: { new: 'login', destroy: 'logout' }

  resources :categories do
    resources :tasks do
      collection do
        get 'today' => 'tasks#due_today', as: :due_today
      end
    end
  end
  root 'pages#home'
end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
#   root "categories#index"
#  end
