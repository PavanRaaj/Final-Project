Rails.application.routes.draw do
  get 'homes/index'
  get 'homes/login'
  get 'homes/signup'
  get 'adding_cars/become_a_host'
  get 'admins/admin_login'
  get 'admins/admin_power', as: :admin_power
  get 'admins/admin_adding_car'

  root "homes#index"
  match 'homes/create', :to => 'homes#create', :via => :post
  match 'user/login', :to => 'sessions#login', :via => :post
  match 'user/admin', :to => 'admins#admin', :via => :post
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
