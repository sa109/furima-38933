class PurchasesController < ApplicationController
 
  def index
    @purchase_shipping_adres = PurchaseShippingAdres.new
  end

  def create
    @purchase_shipping_adres = PurchaseShippingAdres.new(purchase_params)
    if @purchase_shipping_adres.valid?
       @purchase_shipping_adres.save
       return redirect_to root_path
    else
      render :index
    end
  end

  private
 
  def purchase_params
    params.require(:purchase_shipping_adres).permit(:post_code, :region_id, :city, :block, :building, :phone_number).maerge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
