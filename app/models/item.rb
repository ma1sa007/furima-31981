class Item < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area

  has_one_attached :image


  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
  end

    with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :days_to_ship_id
    validates :product_condition_id
    validates :shipping_area_id
    validates :shipping_charge_id

    validates :selling_price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }
  end

  has_one :order
  has_one :purchase_information
  belongs_to :user
  #ジャンルの選択が「--」の時は保存できないようにする
end
