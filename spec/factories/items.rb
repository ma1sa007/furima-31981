FactoryBot.define do
  factory :item do
    product_name {"test"}
    product_description_id {"test"}
    days_to_ship_id {2}
    category_id {2}
    product_condition_id {2}
    shipping_charge_id {2}
    shipping_area_id {2}

    selling_price{1000}

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
 end
end
