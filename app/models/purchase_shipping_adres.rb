class PurchaseShippingAdres
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :block, :building, :phone_number, :purchase_id, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: {other_than: 0, message: "can't be blank"}
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid"}
    validates :token
  end
  

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    shippingday.create(post_code: post_code, region_id: region_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase_id)
  end
end