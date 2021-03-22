Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'workdays#index'
  
  devise_for :users

  
  resources :products, only: %i[index new create edit update destroy]
  resources :workdays, only: %i[index new create show destroy]
  resources :workday_products, only: %i[new create edit update destroy]
  resources :orders, only: %i[create show destroy]
  resources :customers, only: %i[index]
  resources :stores, only: %i[show edit update]
  
  get '/:slug/:date', to: 'friendly_orders#new', as: :friendly_orders, constraints: lambda { |req| Workday.by_slug(req.params[:slug], req.params[:date]).any? }
  post '/:slug/:date', to: 'friendly_orders#create', constraints: lambda { |req| Workday.by_slug(req.params[:slug], req.params[:date]).any? }
end
