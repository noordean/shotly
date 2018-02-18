require "rails_helper"

RSpec.describe Url, type: :model do
  context "when validating fields" do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_uniqueness_of(:original_url).case_insensitive }
  end

  context "when validating associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:locations) }
  end
end
