class LocationsController < ApplicationController
  # GET /url/:id/locations
  def get_url_locations
    if url_creator?(params[:id])
      locations = Url.find(params[:id]).locations
      json_response(locations)
    else
      json_response({
                      message: "Only the url creator can access its locations"
                    }, :unauthorized)
    end
  end

  private

  def url_creator?(url_id)
    url_user = Url.find(url_id).user
    if url_user then url_user.id == current_user end
  end
end
