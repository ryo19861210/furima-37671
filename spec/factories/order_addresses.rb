FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    place_id { 2 }
    town { '東京都' }
    number { '1-1' }
    build_name { '東京ハイツ' }
    phone_number { '08060982235' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
