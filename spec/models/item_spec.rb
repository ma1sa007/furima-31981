require 'rails_helper'
RSpec.describe Item, type: :model  do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品新規登録' do
    context '商品の登録がうまくいくとき' do
      it " text,category_id,product_conditione_id,hipping_charge_id,shipping_charge_id,hipping_area_id,days_to_ship_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品の登録がうまくいかないとき' do
        it "商品画像を1枚つけることが必須であること" do
          @item.image =nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "商品名が必須であること" do
          @item.product_name =nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product name can't be blank")
        end

        it "商品の説明が必須であること" do
          @item.product_description_id  =nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product description can't be blank")
        end

        it "カテゴリーの情報が必須であること" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end
        it "商品の状態についての情報が必須であること" do
          @item.product_condition_id =nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Product condition can't be blank")
        end

        it " 配送料の負担についての情報が必須であること" do
          @item.shipping_charge_id =1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
        end

        it "発送元の地域についての情報が必須であること" do
          @item.shipping_area_id =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank")
        end

        it "発送までの日数についての情報が必須であること" do
          @item.days_to_ship_id=""
          @item.valid?
          expect(@item.errors.full_messages).to include("Days to ship can't be blank")
        end

        it "価格についての情報が必須であること" do
          @item.selling_price =""
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price can't be blank")
        end

        it "価格の範囲が、¥300以上であること" do
          @item.selling_price =50
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price must be greater than or equal to 300")
        end

        it "価格の範囲が、¥9,999,999以下であること" do
          @item.selling_price =10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price must be less than or equal to 9999999")
        end

        it "販売価格は半角数字のみ保存可能であること" do
          @item.selling_price ="１２３"
          @item.valid?
          expect(@item.errors.full_messages).to include("Selling price is not a number")
        end

        # it "入力された販売価格によって、販売手数料や販売利益の表示が変わること" do
        #   @item.price ="123456789"
        #   @user.valid?
        #   expect(@user.errors.full_messages).to include("The display of sales commissions and sales profits changes depending on the entered sales price.")
        # end

        # it "エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）" do
        #   @item.price =""
        #   @item.valid?
        #   expect(@item.errors.full_messages).to include("Error handling is possible (If an inappropriate value is entered, the information will not be saved and an error message will be output.")
        # end

        # it "入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること" do
        #   @user.updated_id =""
        #   @user.valid?
        #   expect(@user.errors.full_messages).to include("If the listing button is pressed with input problems, you will be returned to the listing page and an error message will be displayed.")
        # end
      end
   end
end