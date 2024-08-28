
# Rails.application.routes.draw do

#   mount ActionCable.server => '/cable'

#   mount_devise_token_auth_for 'User', at: 'auth', controllers: {
#     registrations: 'auth/registrations',
#     sessions: 'auth/sessions'
#   }

#   patch '/auth', to: 'auth/registrations#update'


#   resources :reminders do
#     collection do
#       get 'index_by_date'
#     end

#     member do
#       patch 'complete'
#       patch 'update' # Adding the route to update a reminder (task)
#       get :special_events
#       post 'add_user'
#       put 'complete'

#     end
#   end
#   resources :friend_requests, only: [:create] do
#     member do
#       put 'accept'
#       get 'received' 
#       put 'decline'
#       get 'sent'
#       get 'accepted'
#     end
#   end
  
#   resources :invitations, only: [:index, :create, :update, :destroy] do
#     post 'accept', on: :member
#     post 'decline', on: :member
#     post 'reschedule', on: :member
#     get 'history', to: 'invitations#history'

#   end
#   # routes.rb (Rails example)
# get '/users', to: 'users#index', as: 'users'
# # routes.rb (Rails example)
# get '/friend_requests/:user_id/accepted', to: 'friend_requests#accepted', as: 'accepted_friend_requests'

#   get '/users/search', to: 'users#search'
#   get '/friend_requests/:user_id/accepted', to: 'friend_requests#accepted'


#   get 'messages/unread-count', to: 'messages#unread_count'

#   resources :tasks, only: [:index, :show, :create, :update, :destroy], controller: 'reminders'
#   resources :notes
#   resources :profiles, only: [:show, :edit, :update]

#   resources :notifications, only: [:index, :create] do
#     collection do
#       post 'send_notification_email' # Define a custom POST route for sending notification emails
#     end
#   end
#   post 'broadcast_notification', to: 'notifications#broadcast'


# end

# Rails.application.routes.draw do
#   mount ActionCable.server => '/cable'

#   mount_devise_token_auth_for 'User', at: 'auth', controllers: {
#     registrations: 'auth/registrations',
#     sessions: 'auth/sessions'
#   }

#   patch '/auth', to: 'auth/registrations#update'

#   resources :reminders do
#     collection do
#       get 'index_by_date'
#     end

#     member do
#       patch 'complete'
#       patch 'update'
#       get :special_events
#       post 'add_user'
#       put 'complete'
#     end
#   end

#   resources :friend_requests, only: [:create] do
#     member do
#       put 'accept'
#       get 'received'
#       put 'decline'
#       get 'sent'
#       get 'accepted'
#     end
#   end
  
#   resources :invitations, only: [:index, :create, :update, :destroy] do
#     post 'accept', on: :member
#     post 'decline', on: :member
#     post 'reschedule', on: :member
#     get 'history', to: 'invitations#history'
#   end

#   get '/users', to: 'users#index', as: 'users'
#   get '/users/search', to: 'users#search'
  
#   get '/friend_requests/:user_id/accepted', to: 'friend_requests#accepted', as: 'accepted_friend_requests'

#   get 'messages/unread-count', to: 'messages#unread_count'

#   resources :tasks, only: [:index, :show, :create, :update, :destroy], controller: 'reminders'
#   resources :notes
#   resources :profiles, only: [:show, :edit, :update]

#   resources :notifications, only: [:index, :create] do
#     collection do
#       post 'send_notification_email'
#     end
#   end

#   post 'broadcast_notification', to: 'notifications#broadcast'
# end


Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions'
  }

  patch '/auth', to: 'auth/registrations#update'

  resources :reminders do
    collection do
      get 'index_by_date'
    end

    member do
      patch 'complete'
      patch 'update'
      get 'special_events'
      post 'add_user'
      put 'complete'
    end
  end

  resources :friend_requests, only: [:create] do
    member do
      put 'accept'
      get 'received'
      put 'decline'
      get 'sent'
      get 'accepted'
    end
  end
  
  resources :invitations, only: [:index, :create, :update, :destroy] do
    member do
      post 'accept'
      post 'decline'
      post 'reschedule'
    end
    collection do
      get 'history'
    end
  end

  get '/users', to: 'users#index', as: 'users'
  get '/users/search', to: 'users#search'
  
  get '/friend_requests/:user_id/accepted', to: 'friend_requests#accepted', as: 'accepted_friend_requests'

  get 'messages/unread_count', to: 'messages#unread_count'

  resources :tasks, only: [:index, :show, :create, :update, :destroy], controller: 'reminders'
  resources :notes
  resources :profiles, only: [:show, :edit, :update]

  resources :notifications, only: [:index, :create] do
    collection do
      post 'send_notification_email'
    end
  end

  post 'broadcast_notification', to: 'notifications#broadcast'

  resources :chatrooms do
    collection do
      get 'check_or_create'
    end
    member do
      get 'messages'
    end
  end

  resources :messages, only: [:create, :index] # Ensure this line is outside of the chatrooms block
end
