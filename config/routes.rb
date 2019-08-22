Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :quests, only: [:index, :show] do
    resources :participations, only: :create
  end

  namespace :questmaster do
    resources :quests do
      resources :participations, except: [:show, :new, :create, :edit, :destroy, :update, :new] do
        resources :reviews, only: [:index, :new, :create, :edit, :update]
      end
    end
  end

  resources :participations, only: [:index, :show, :destroy] do
	resources :reviews, only: [:new, :create]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
