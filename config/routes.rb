Rails.application.routes.draw do

  devise_for :users,
      controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'pages#home'

  resources :users


  resources :events do
    resources :reviews
    collection do
      get 'search', to: "events#search"
    end
  end

  get ':region', to: "events#region"

  get 'pages/home'

  get 'pages/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
