Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :quests, only: [:index, :show]

  namespace :questmaster do
    resources :quests do
      resources :participations, except: [:show, :new, :create, :edit, :destroy, :update, :new] do
        resources :reviews, only: [:index, :new, :create, :edit, :update]
      end
    end
  end

  get '/questmaster/quests', to: 'quests#validate'
  resources :participation, only: [:index, :show, :create, :destroy] do
	resources :reviews, only: [:new, :create]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
