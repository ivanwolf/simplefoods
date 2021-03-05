Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'workdays#index'

  resources :products, only: %i[index new create destroy]
  resources :workdays, only: %i[index new create show destroy]
  resources :workday_products, only: %i[new create destroy]
  resources :orders, only: %i[new create show destroy]
end
