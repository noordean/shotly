require "rails_helper"

RSpec.describe LocationsController, type: :request do
  let!(:user) { create :user }
  let!(:url) { create :url, user_id: user.id }
  let!(:location) { create :location, url_id: url.id }
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /url/:id/location" do
    before { get "/url/#{url.id}/locations", headers: headers }

    it "returns all locations from which a url has been visited" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0]["country"]).to eq("Nigeria")
      expect(json[0]["url_id"]).to eq(url.id)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
