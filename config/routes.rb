Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: 'pages#profile'
  root to: 'pages#home'
  resources :quests, only: [:index, :show] do
    resources :chat_rooms, only: [:show] do
        resources :messages, only: [:create]
    end
    resources :participations, only: [:create] do
      resources :reviews, only: [:create]
    end
  end

  namespace :questmaster do
    resources :quests do
      resources :chat_rooms, only: [:show] do
        resources :messages, only: [:create]
      end
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

  get '/search', to:'quests#search', as: 'search'
  get 'rewards', to:'pages#rewards'
  # post 'questmaster/quest/:quest_id/chat_rooms/:id/messages', to: 'messages#create', as: 'chat_room_messages'
  # get 'questmaster/quest/:quest_id/chat_rooms/:id', to: 'chat_rooms#show', as: 'chat_room'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
