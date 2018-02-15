require "rails_helper"

RSpec.describe UrlsController, type: :request do
  let(:json) { JSON.parse(response.body) }

  describe "POST /urls" do
    let(:valid_url_params) do
      {
        original_url: "google.com/an-ugly-url"
      }
    end
    let(:invalid_url_params) do
      {
        original_url: "google"
      }
    end

    context "when the request is valid" do
      before do
        post "/urls", params: valid_url_params
      end

      it "returns a clean shortened url from the supplied ugly one" do
        urls = Url.all
        expect(json["shortened_url"]).to eq(urls[0].shortened_url)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the member does not exist" do
      before do
        post "/urls", params: invalid_url_params
      end

      it "return an error message" do
        expect(json["message"]).to eq("Original url must be a valid url")
      end

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
