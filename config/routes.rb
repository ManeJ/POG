Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'pages#profile'
  root to: 'pages#home'
  resources :quests, only: [:index, :show] do
    resources :participations, only: [:create] do
      resources :reviews, only: [:create]
    end
  end

  namespace :questmaster do
    resources :quests do
      resources :reviews, only: [:new, :create, :index]
      resources :participations, except: [:show, :new, :create, :edit, :destroy, :update, :new] do
        resources :reviews, only: [:edit, :update]
      end
    end
  end

  resources :participations, only: [:index, :show, :destroy] do
	  resources :reviews, only: [:new, :show]
    get 'result', to: 'participations#result'
  end

  get 'rewards', to:'pages#rewards'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
