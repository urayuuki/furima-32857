FactoryBot.define do
  factory :item do  # 値は適当です
    name              { 'tomato' }
    price             { 500 }
    description       { 'aaa' }

    category_id       { 2 }
    condition_id { 2 }
    shipping_id { 2 }
    shipment_source_id { 2 }
    shipping_date_id   { 2 }

    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
