Rails.application.routes.draw do
  root "tops#index"
  
  resources :tops do
    collection do
      post :blogs
    end
  end
  
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
