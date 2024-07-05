class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :move_to_index, except: [:index, :show]
  before_action :access_to_edit, only: :edit

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else render :edit, status: :unprocessable_entity
    end
  end


  def show
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :content, :category_id, :condition_id, :bear_id, :area_id, :number_of_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def access_to_edit
    unless current_user == @item.user
      redirect_to action: :index
    end
  end
end

