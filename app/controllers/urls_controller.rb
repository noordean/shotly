class UrlsController < ApplicationController
  include UrlGenerator

  # POST /urls
  def create
    existing_url = Url.already_exists?(handle_url_format(params[:original_url]))
    if existing_url
      json_response(existing_url)
    else
      url = Url.create!(
        original_url: handle_url_format(params[:original_url])
      )
      shortened_url = generate_url(url.id)
      updated_url = Url.update(
        url.id,
        shortened_url: "http://#{request.host_with_port}/#{shortened_url}"
      )
      json_response(updated_url, :created)
    end
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
    params.permit(:original_url, :user_id)
  end
end
