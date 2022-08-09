Rails.application.routes.draw do
  get 'homes/index', to: "homes#index"
  get 'homes/login'
  get 'homes/signup'
  get 'homes/become_a_host', to: "homes#become_a_host"
  get 'admins/admin_login'
  get 'admins/admin_power', as: :admin_power
  get 'admins/admin_adding_car'
  get 'booking_car/booking_page', to: "booking_car#booking_page"
  get 'booking_car/listing_cars', to: "booking_car#listing_cars", as: :listing_cars
  
  get 'booking_car/booking_confirmation_page', to: "booking_car#booking_confirmation_page", as: :booking_confirmation
  get 'payments/payment_page', to: "payments#payment_page"
  get 'homes/terms_and_condition_page'
  get 'payments/ending_page', to: "payments#ending_page", as: :ending_page
  
  root "homes#index"
  match 'homes/create', :to => 'homes#create', :via => :post
  match 'user/login', :to => 'sessions#login', :via => :post
  match 'user/admin', :to => 'admins#admin', :via => :post
  match 'admins/admin_add_car', :to => 'admins#admin_add_car', :via => :post
  delete '/remove_car/:id' => 'admins#remove_car'
  match 'booking_car/booking_detail', :to =>'booking_car#booking_detail', :via =>:post
  post "/book/:car_id", to: "booking_car#car_id_setter"
  delete "logout", to: "sessions#logout", as: :destroy_session
  match 'payments/payment_details', :to => 'payments#payment_details', :via => :post
  match '/search', to: "booking_car#search", :via => :get
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
