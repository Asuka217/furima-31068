FactoryBot.define do
  factory :buyer_info do
    post_code { '123-4567' }
    region_id { 3 }
    city { '中野区' }
    address { '1-1-1' }
    building { 'ビルビル' }
    telephone { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000'}
  end
end
