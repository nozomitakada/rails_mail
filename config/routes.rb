Rails.application.routes.draw do
  root to: "tops#index"
   get 'sessions/new'
   
   resources :favorites, only:[:create, :destroy] do
       collection do
           post :blogs
       end
   end
   
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users, only:[:new, :show]

 resources :tops do
   collection do
     get :tops
   end
 end
 
 resources :new do
   collection do
     post :new
   end
 end
 
    resources :blogs do
        collection do
            post :confirm
        end
    end
    
    
end
