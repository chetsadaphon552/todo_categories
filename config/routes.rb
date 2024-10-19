Rails.application.routes.draw do
  resources :categories do
    resources :tasks, only: [:index] 
  end

  resources :tasks do
    member do
      get 'complete'
      patch 'toggle_status' 
    end
  end
end
