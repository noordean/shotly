Rails.application.routes.draw do
  resources :urls
  get "/:path" => "urls#redirect"

  resources :users
  post "/login" => "users#login"
  get "/user/urls" => "urls#get_user_urls"

  get "/url/:id/locations" => "locations#get_url_locations"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
