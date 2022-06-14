FactoryBot.define do
  factory :item do
    image                           { Faker::Lorem.sentence }
    name                            { '名前' }
    profile                         { '説明' }
    category_genre_id               { 2 }
    status_genre_id                 { 2 }
    send_price_genre_id             { 2 }
    place_genre_id                  { 2 }
    scheduled_day_genre_id          { 2 }
    price                           { 2000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/sample1.png'), filename: 'sample1.png')
    end
  end
end
