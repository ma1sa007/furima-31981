class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code            , null: false
      t.integer :shipping_area_id       , null: false
      t.string :municipalities         , null: false
      t.string :address                , null: false
      t.string :building_name          , null: false
      t.string :phone_number           , null: false
      t.references :purchase_information           , null: false


      t.timestamps
    end
  end
end
