class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  before_action :move_to_index, except: [:update, :destroy, :edit]
    
    def index
         @items = Item.all.order("created_at DESC")
     end

    
     def new
        @item = Item.new
      end

     def create
        @item = Item.new(item_params)
        if @item.save
          redirect_to root_path
        else
          render :new
        end
      end

      def show
        @item = Item.find(params[:id])
      end

      def edit
        @item = Item.find(params[:id])
        if current_user != @item.user
          redirect_to root_path
        end
      end
    
      def update
        @item = Item.find(params[:id])
        if current_user != @item.user
         redirect_to item_path
        end
      end

      def destroy
        @item = Item.find(params[:id])
        if current_user != @item.user
         redirect_to root_path
       end
     end
    
      private
    
      def item_params
        params.require(:item).permit(:image, :product_name, :product_description, :category_id,:product_condition_id, :selling_price, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
      end

      def set_tweet
        @item = Item.find(params[:id])
      end
    
      def move_to_index
        unless user_signed_in?
          redirect_to action: :index
        end
end
