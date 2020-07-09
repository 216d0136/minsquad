Rails.application.routes.draw do
  #root to: 'home#top'
  devise_for :users
  resources :users,only: [:show,:edit,:update,:index] do
  	resource :relationships, only: [:create, :destroy]
  	get 'follows' => 'relationships#follwer', as: 'follows'
  	get 'followers' => 'relationships#followed', as: 'followers'
  end
  resources :teams do
    resources :team_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]	
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
