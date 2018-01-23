Rails.application.routes.draw do
  get 'admin/main'
  get 'admin/users'
  get 'pages/home'
  get 'pages/about'
  get 'pages/stock'

  resources :dji_prices
  resources :dji_forecasts
  resources :dji_nlps
  devise_for :users

  scope "admin" do
    resources :users do
      member do
        delete 'destroy'
        get 'new'
        post 'create'
        get 'edit'
        patch 'update'
        get 'notes'
        post 'grantadmin'
        post 'resetpassword'
      end
    end
  end

  scope "pages" do
    resources :pages do
      member do
        get 'import_dji'
        get 'forecast_dji'
        get 'nlp_dji'
      end
    end
  end

  root 'pages#home'

end
