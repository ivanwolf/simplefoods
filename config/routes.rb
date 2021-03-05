Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: %i[index new create]
  resources :workdays, only: %i[index new create show destroy]
  resources :workday_products, only: %i[new create destroy]
end
