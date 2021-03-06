class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
    
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
      end

      def edit
        if current_user != @item.user || @item.purchase_information.present?
          redirect_to root_path
        end
      end
    
      def update
        if current_user != @item.user
         redirect_to item_path
        end
          if @item.update(item_params)
         redirect_to root_path
          else
         render :edit
        end  
      end

      def destroy
        if current_user != @item.user || @item.purchase_information.present?
          redirect_to root_path
        end
          @item.destroy
         redirect_to root_path
     end
    
      private
    
      def item_params
        params.require(:item).permit(:image, :product_name, :product_description, :category_id,:product_condition_id, :selling_price, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
      end

      def set_item
        @item = Item.find(params[:id])
      end    
end
