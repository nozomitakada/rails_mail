Rails.application.routes.draw do
  root to: "tops#index"
  
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
