Rails.application.routes.draw do

  resources :users, only: [:new, :create], path_names: { new: 'signup' }

  resources :sessions, only: [:new, :create], path_names: { new: 'login'} do
    collection do
      delete 'logout' => 'sessions#destroy'
    end
  end

  resources :categories do
    resources :tasks do
      collection do
        get 'today' => 'tasks#due_today', as: :due_today
      end
    end
  end

  root 'pages#home'
end