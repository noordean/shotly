Rails.application.routes.draw do
  resources :urls
  get "/:path" => "urls#redirect"
  get "/user/urls" => "urls#get_user_urls"
  get "/url/total" => "urls#get_total_url"

  resources :users
  post "/login" => "users#login"
  get "/user/total" => "users#get_total_user"

  get "/url/:id/locations" => "locations#get_url_locations"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
