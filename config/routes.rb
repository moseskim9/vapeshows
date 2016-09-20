Rails.application.routes.draw do



  devise_for :users

  root 'pages#home'

  resources :users

  resources :events do

    resources :reviews

  end

  get 'pages/home'

  get 'pages/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
