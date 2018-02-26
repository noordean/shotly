require "rails_helper"

RSpec.describe UrlsController, type: :request do
  let!(:url) { create :url }
  let(:json) { JSON.parse(response.body) }

  describe "GET /url/total" do
    before { get "/url/total" }

    it "returns total number of urls in the database" do
      expect(json).not_to be_empty
      expect(json["message"]).to eq(1)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
