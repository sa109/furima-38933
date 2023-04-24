class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user)
  end

  def new
    @items = Item.new
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
    params.require(:item).parmit(:name, :description, :image, :status_id, :postage_id, :region_id, :shipping_day_id, :category_id).merge(user_id: current_user.id)
  end


end
