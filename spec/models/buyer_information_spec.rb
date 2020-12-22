require 'rails_helper'

RSpec.describe BuyerInformation, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: user.id)
    @buyer_information = FactoryBot.build(:buyer_information, user_id: user.id)
  # pending "add some examples to (or delete) #{__FILE__}"  
  end

 describe '商品の購入登録' do
    context '商品の購入登録がうまくいくとき' do
    it " postal_code,shipping_area_id,municipalities,address,building_name,phone_number,purchase_informationが存在すれば登録できる" do
      expect(@buyer_information).to be_valid
    end
    
    it " building_nameが空でも登録できる" do
      @buyer_information.building_name =""
      expect(@buyer_information).to be_valid
    end
   end

   context '商品の購入登録がうまくいかないとき' do
       it "クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと" do
        @buyer_information.token = nil
        @buyer_information.valid?
        expect(@buyer_information.errors.full_messages).to include("Token can't be blank")
       end


       it "配送先の情報として、郵便番号が必須であること" do
        @buyer_information.postal_code = ""
        @buyer_information.valid?
         expect(@buyer_information.errors.full_messages).to include("Postal code can't be blank")
       end

       it "配送先の情報として、都道府県が必須であること" do
        @buyer_information.shipping_area_id = nil
        @buyer_information.valid?
        expect(@buyer_information.errors.full_messages).to include("Shipping area can't be blank")
       end

       it "配送先の情報として、市区町村・が必須であること" do
        @buyer_information.municipalities = nil
        @buyer_information.valid?
        expect(@buyer_information.errors.full_messages).to include("Municipalities can't be blank")
       end

       it "配送先の情報として、番地が必須であること" do
        @buyer_information.address = nil
        @buyer_information.valid?
        expect(@buyer_information.errors.full_messages).to include("Address can't be blank")
       end

       it "配送先の情報として、電話番号が必須であること" do
        @buyer_information.phone_number = nil
        @buyer_information.valid?
        expect(@buyer_information.errors.full_messages).to include("Phone number can't be blank")
       end

       it "郵便番号にはハイフンが必要であること（123-4567となる）" do
         @buyer_information.postal_code = "1111111"
         @buyer_information.valid?
         expect(@buyer_information.errors.full_messages).to include("Postal code postal codeには-を使用してください")
       end

       it "電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）" do
         @buyer_information.phone_number = 123123123123
         @buyer_information.valid?
         expect(@buyer_information.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it "電話番号に数字以外入っていた場合登録できない" do
          @buyer_information.phone_number = "あ漢ａ"
          @buyer_information.valid?
          expect(@buyer_information.errors.full_messages).to include("Phone number phone_numberには数字のみを使用してください")
        end

        it "都道府県は１以外でないと登録できないこと" do
          @buyer_information.shipping_area_id = 1
          @buyer_information.valid?
          expect(@buyer_information.errors.full_messages).to include("Shipping area must be greater than or equal to 2")
        end

      end
  end
end











