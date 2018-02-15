class Url < ApplicationRecord
  belongs_to :user, optional: true

  validates_presence_of :original_url
  validates :original_url, uniqueness: { case_sensitive: false }, format: {
    with: /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,3}(:[0-9]{1,5})?(\/.*)?\z/ix,
    message: "must be a valid url"
  }
  def self.already_exists?(url)
    Url.find_by(original_url: url)
  end
end
