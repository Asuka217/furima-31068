FactoryBot.define do
  factory :buyer_info do
    post_code { '123-4567' }
    region_id { '3' }
    city { '中野区' }
    address { '1-1-1' }
    building { 'ビルビル' }
    telephone { '08012345678' }
  end
end
