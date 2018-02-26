class UrlsController < ApplicationController
  include UrlGenerator

  # POST /urls
  def create
    existing_url = Url.already_exists?(handle_url_format(params[:original_url]))
    if existing_url
      json_response(existing_url)
    else
      url = Url.create!(
        original_url: handle_url_format(params[:original_url]),
        number_of_click: 0,
        user_id: current_user
      )
      shortened_url = generate_url(url.id)
      updated_url = Url.update(
        url.id,
        shortened_url: "http://#{request.host_with_port}/#{shortened_url}"
      )
      json_response(updated_url, :created)
    end
  end

  # GET /:path
  def redirect
    url = Url.find_by(
      shortened_url: "http://#{request.host_with_port}/#{params[:path]}"
    )
    if url
      url.update(number_of_click: url.number_of_click + 1)
      Location.create!(country: request.location.city, url_id: url.id)
      redirect_to(url.original_url, status: 302)
    else
      json_response({
                      message: "Page Not Found"
                    }, :not_found)
    end
  end

  # GET /user/urls
  def get_user_urls
    urls = User.find(current_user).urls
    json_response(urls)
  end

  private

  def handle_url_format(url)
    if url[/(^http)/]
      url
    else
      "http://#{url}"
    end
  end

  def url_params
    params.permit(:original_url, :number_of_click)
  end
end
