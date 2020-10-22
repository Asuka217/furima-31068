class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
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
    params.require(:item).permit(:title, :explication, :price, :image, :category_id, :item_status_id, :fee_shipping_id, :region_id, :days_to_ship_id).merge(user_id: current_user.id)
  end
end
