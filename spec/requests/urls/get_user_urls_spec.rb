require "rails_helper"

RSpec.describe UrlsController, type: :request do
  let!(:user) { create :user }
  let!(:url) { create :url, user_id: user.id }
  let!(:location) { create :location, url_id: url.id }
  let(:json) { JSON.parse(response.body) }
  let(:headers) { set_header(user.id) }

  describe "GET /user/urls" do
    before { get "/user/urls", headers: headers }

    it "returns all urls that belong to a user" do
      expect(json).not_to be_empty
      expect(json.size).to eq(1)
      expect(json[0][0]["original_url"]).to eq("http://something-long.com")
      expect(json[0][0]["shortened_url"]).to eq("http://localhost:3000/ca")
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
