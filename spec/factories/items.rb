FactoryBot.define do
  factory :item do
    title { 'テスト' }
    explication { 'これはテストです。' }
    price { '10000' }
    category_id { '3' }
    item_status_id { '3' }
    fee_shipping_id { '2' }
    region_id { '3' }
    days_to_ship_id { '3' }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
