Rails.application.routes.draw do
  devise_for :users

  resources :target_behaviors

  root "pages#home"
end
