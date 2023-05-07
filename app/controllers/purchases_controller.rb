class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchase_shippingday = PurchaseShippingDay.new
  end

  def create
    @purchase_shippingday = PurchaseShippingDay.new(purchase_params)
    if @purchase_shippingday.valid?
      @purchase_shippingday.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
 
  def purchase_params
    params.require(:purchase_shippingday).permit(:post_code, :region_id, :city, :block, :building, :phone_number).maerge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
