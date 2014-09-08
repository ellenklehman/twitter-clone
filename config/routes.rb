Rails.application.routes.draw do
devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :users do
    resources :tweets
  end

  resources :followings
  root to: 'users#index'
end
