class ItemsController < ApplicationController
  # ログインしていないユーザーはログインページに促す
  before_action :authenticate_user!, except: [:index, :show]

  # 重複処理をまとめる
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # 売却済みの自身が出品した商品の編集・削除画面に遷移できないように実装
  before_action :present_url, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
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
     # ログインしているユーザーと同一であればeditファイルが読み込まれる
    if current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(item_params)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
         redirect_to root_path
      else
        render action: 'show'
      end
    else
       redirect_to root_path
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def prevent_url
    if @item.user_id != current_user.id || @item.purchase != nil
      redirect_to root_path
    end

  def item_params
    params.require(:item).permit(:name, :description, :image, :status_id, :postage_id, :region_id, :shipping_day_id,
                                 :category_id, :price).merge(user_id: current_user.id)
  end
end
