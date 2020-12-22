class BuyerInformation 
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :shipping_area_id, :municipalities, :address, :building_name, :phone_number, :purchase_information, :user_id, :item_id, :token


  with_options presence: true do
    validates :shipping_area_id
    validates :municipalities
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code,format:{ with: /\A\d{3}[-]\d{4}\z/, message:'postal codeには-を使用してください' } 
  end


  def save
    purchase_information = PurchaseInformation.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_information_id: purchase_information.id)

  end
end