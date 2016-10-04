Rails.application.routes.draw do

  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'pages#home'

  resources :users

  get ':region', to: "events#region"

  resources :events do
    resources :reviews
    collection do
      get 'search', to: "events#search"
    end
  end

  get 'pages/home'

  get 'pages/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
