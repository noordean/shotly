class Location < ApplicationRecord
  belongs_to :url

  validates_presence_of :url_id
end
