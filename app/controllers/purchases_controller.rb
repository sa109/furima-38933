class PurchasesController < ApplicationController
  def index
  end

  def new
    @purchaseshippingday = PurchaseShippingDay.new
  end
end
