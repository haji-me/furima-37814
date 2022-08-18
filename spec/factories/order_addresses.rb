FactoryBot.define do
  factory :order_address do
    postcode { '213-0022' }
    prefecture_id { '3' }
    municipality { '横浜市' }
    street_number { '3-3' }
    building_name { 'プラレールビル' }
    phone { '09012345678' }
    token { 'aaaaaaaaaaaaa' }
  end
end
