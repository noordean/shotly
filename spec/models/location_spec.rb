require "rails_helper"

RSpec.describe Location, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:url_id) }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:url) }
  end
end
