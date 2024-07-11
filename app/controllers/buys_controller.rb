class BuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_params, only: [:index, :create]

  def index
    if (current_user.id != @item.user_id) && (@item.buy == nil)
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @buy_address = BuyAddress.new
    else
     redirect_to root_path
    end
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:post_code, :area_id, :municipalities, :block, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end
