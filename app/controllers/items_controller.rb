class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :move_to_index, except: [:index, :new, :create, :show]

  def index
    @items = Item.all.order('created_at DESC')
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
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :explication, :price, :image, :category_id, :item_status_id, :fee_shipping_id, :region_id, :days_to_ship_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
