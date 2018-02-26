require "rails_helper"

RSpec.describe UsersController, type: :request do
  let!(:user) { create :user }
  let(:json) { JSON.parse(response.body) }

  describe "GET /user/total" do
    before { get "/user/total" }

    it "returns total number of users in the database" do
      expect(json).not_to be_empty
      expect(json["message"]).to eq(1)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end
end
