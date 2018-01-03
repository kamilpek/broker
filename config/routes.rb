Rails.application.routes.draw do
  get 'admin/main'

  get 'admin/users'

  get 'pages/home'

  get 'pages/about'

  get 'pages/stock'

  resources :dji_prices
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
