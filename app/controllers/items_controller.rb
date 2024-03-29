class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  private
  def item_params
    params.require(:item).permit(:price, :item_name, :description, :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, :image).merge(user_id: current_user.id)
  end
end
