FactoryBot.define do
  factory :item do
    price               {'1000'}
    item_name           {'アイテム'}
    description         {'アイテムの説明'}
    category_id         {'2'}
    condition_id        {'2'}
    shipping_fee_id     {'2'}
    prefecture_id       {'2'}
    shipping_day_id     {'2'}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
