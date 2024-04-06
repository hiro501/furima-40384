FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567'}
    prefecture_id { 2 }
    city { '神戸市' }
    street_address { '1-1' }
    building { 'ビル' }
    phone_number { '09012345678' }
  end
end
