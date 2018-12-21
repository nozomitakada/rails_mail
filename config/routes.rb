Rails.application.routes.draw do
  resources :feeds
    root to: "tops#index"
    resources :favorites, only:[:create, :destroy]
    resources :sessions, only: [:new, :create, :show, :destroy]
    resources :users, only:[:new, :show, :create]
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
    resources :contacts
    
    resources :letter_opener
    
##    mount LetterOpenerWeb::Engine, at:"/letter_opener" if Rails.env.development?
##    if Rails.env.development? || Rails.env.production?
##        mount LetterOpenerWeb::Engine, at:"/letter_opener"
##    end
end