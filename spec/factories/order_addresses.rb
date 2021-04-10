FactoryBot.define do
  factory :order_address do
    post_num { '123-4567' }
    shipment_source_id { 4 }
    city { '豊中' }
    address { '上新 1-2-3' }
    build_name { 'xxx'}
    phone_num { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
