class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :set_buy, only: [:index, :create]
  
  def index
    @buyer_info = BuyerInfo.new
  end

  def create 
    @buyer_info = BuyerInfo.new(buyer_params)
    if  @buyer_info.valid?
      pay_item
      @buyer_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def buyer_params
    params.require(:buyer_info).permit(:post_code, :region_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: (params[:item_id]), token: (params[:token]))
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def set_buy
    @item = Item.find(params[:item_id])
  end

  def move_to_index 
    user = User.select([:id])
    buy = Buy.select([:id])
    item = Item.find(params[:item_id])
    if  current_user.id == item.user_id || item.buy.present?
      redirect_to root_path
    end
  end
end

