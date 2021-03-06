class BuyerInformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index

    if current_user.id == @item.user_id  || @item.purchase_information.present?
      redirect_to root_path
    end 

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
  end

  private

  def item_params
    params.require(:buyer_information).permit(:postal_code, :shipping_area_id, :municipalities, :building_name, :phone_number, :address ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end  

def order_params
  params.permit(:price).merge(token: params[:token])
end

def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount:@item.selling_price,  # 商品の値段
    card: order_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
end
end

