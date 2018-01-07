Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resources :links, only: [:new, :create, :index, :show, :edit, :update] do
    resources :comments, only: [:create]
  end
  resource :session, only: [:new, :create, :destroy]
  resources :comments, only: [:destroy]
end
