class PurchaseShippingAdres
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block, :building, :phone_number, :purchase_id, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :region_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block
    validates :token
  end

  with_options presence: true do
    validates :phone_number, length: { minimum: 10, maximum:11, message: "is too short"}, format: {with: /\A[0-9]{11}\z/, message: "is invalid. Input only number"}
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    ShippingAdres.create(post_code: post_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end