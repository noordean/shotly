Rails.application.routes.draw do
  resources :urls
  get "/:path" => "urls#redirect"

  resources :users
  post "/login" => "users#login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
