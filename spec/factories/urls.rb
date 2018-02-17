FactoryGirl.define do
  factory :url do
    original_url "http://something-long.com"
    shortened_url "http://localhost:3000/ca"
    number_of_click 0
  end
end
