class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchaseshippingday = PurchaseShippingDay.new
  end

  def create
    @purchaseshippingday = PurchaseShippingDay.new(purchase_params)
    if @purchaseshippingday.valid?
      @purchaseshippingday.save
      redirect_to root_path
    else
      render :new
    end
  end
end
