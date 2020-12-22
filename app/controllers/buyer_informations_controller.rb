class BuyerInformationsController < ApplicationController

  before_action :set_item, only: [:index, :create]

  def index
    @item_buyer = BuyerInformation.new
  end


  def create
    @item_buyer = BuyerInformation.new(item_params)
        if @item_buyer.valid?
          pay_item
          @item_buyer.save
          redirect_to root_path
        else
          render :index
        end
    # @order = Order.new(order_params)
    #      if @order.valid?
    #        pay_item
    #        @order.save
    #      return redirect_to root_path
    #    else
    #     render 'index'
    #    end
  end

  private

  def item_params
    params.permit(:postal_code, :shipping_area_id, :municipalities, :building_name, :phone_number, :address, :user, :item_id,:token).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  

def order_params
  params.permit(:price).merge(token: params[:token])
end

def pay_item
  Payjp.api_key = "sk_test_4aceb86af110765ae3a8fb31"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount:@item.selling_price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
end

