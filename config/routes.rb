Rails.application.routes.draw do
  root to: 'categories#index'
  resources :categories do
    resources :products, only: [:create, :destroy]
  end
end
