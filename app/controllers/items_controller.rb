class ItemsController < ApplicationController
#itemのマイグレーションファイルを作って、そのあと rails db:migrateで反映させる
#商品出品画面に遷移するようにindex.html.erbに記述しているulrを設定する
#newアクション内に@item = Itme.newでインスタンスを作成する
#new.html.erbのfrom_withにモデルを設定する
#new.html.erbのhogeを修正する
#createアクション内で保存出来るようにする
    
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
    
      private
    
      def item_params
        params.require(:item).permit(:image, :product_name, :product_description, :category_id,:product_condition_id, :selling_price, :shipping_charge_id, :shipping_area_id, :days_to_ship_id).merge(user_id: current_user.id)
      end
end
