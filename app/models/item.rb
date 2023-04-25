class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :image, presence: true

  validates :status_id, :region_id, :postage_id, :shipping_day_id, :category_id,numericality: { other_than: 1, message: "can't be blank" }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :category
end 