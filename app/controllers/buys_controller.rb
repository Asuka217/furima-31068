class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @buyer_info = BuyerInfo.new
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create 
    @item = Item.find(params[:item_id])
    @buyer_info = BuyerInfo.new(buyer_params)
    if  @buyer_info.valid?
      @buyer_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 

  def buyer_params
    params.require(:buyer_info).permit(:post_code, :region_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: (params[:item_id]))
  end
end

