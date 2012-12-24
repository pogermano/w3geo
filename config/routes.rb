W3geo::Application.routes.draw do


   devise_for :users, :controllers => { :registrations => "registrations" }
   
    get '/awaiting_confirmation',
         :to => "users#confirmation",
         :as => 'confirm_user'


   namespace :admin do
      root :to => "base#index"
      resources :users do
         resources :permissions
      end
   end

   put '/admin/users/:user_id/permissions',
   :to => 'admin/permissions#update',
   :as => :update_user_permissions


   get "users/index"
   root :to => 'customers#index'
   resources :customers do
      resources :tickets
   end


end
