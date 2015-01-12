Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :users, except: [:destroy, :index]
  resource :session, only: [:new, :create, :destroy]
  resources :lists do
    resources :list_items, only: [:create, :destroy]
  end
  resources :list_topics

end
