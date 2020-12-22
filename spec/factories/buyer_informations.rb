FactoryBot.define do
  factory :buyer_information do
    postal_code {'123-4567'}
    shipping_area_id{2}
    municipalities{2}
    address{2}
    phone_number{'09012345678'}
    item_id {2}
    token {2}
 end
end