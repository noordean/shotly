require "rails_helper"

RSpec.describe UrlsController, type: :request do
  let(:json) { JSON.parse(response.body) }
  let!(:url) { create :url }

  describe "GET /:path" do
    context "when the path matches a shortened_url in the database" do
      before do
        host! "http://localhost:3000"
        get "#{host}/ca"
      end

      it "returns status code 302" do
        expect(response).to have_http_status(302)
      end
    end

    context "when the path does not matches any shortened_url" do
      before do
        host! "http://localhost:3000"
        get "#{host}/nonsense"
      end

      it "return an error message" do
        expect(json["message"]).to eq("Page Not Found")
      end

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end
end
