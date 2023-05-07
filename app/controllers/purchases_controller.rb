class PurchasesController < ApplicationController
  before_action :authenticate_user!


  def index
    @purchase_shippingadres = PurchaseShippingAdres.new
  end

  def new
    @purchase_shippingadres = PurchaseShippingAdres.new
  end

  def create
    @purchase_shippingadres = PurchaseShippingAdres.new(purchase_params)
    if @purchase_shippingadres.valid?
       @purchase_shippingadres.save
       redirect_to root_path
    else
      render 'index'
    end
  end

  private
 
  def purchase_params
    params.require(:purchase_shippingadres).permit(:post_code, :region_id, :city, :block, :building, :phone_number).maerge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
