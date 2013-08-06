Easyblog::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :posts do
    member do
      post :mark_archived
    end
  end
  resources :comments do
    member do
      post :toggle_abusive
      post :thumb_up, :as => :thumb_up
      post :thumb_down, :as => :thumb_down
    end
  end
end
