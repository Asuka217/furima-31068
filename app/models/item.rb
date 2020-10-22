class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :item_status, :fee_shipping, :region, :days_to_ship
  has_one_attached :image
  
  validates: :title, :explication, :price, :category, :item_status, :fee_shipping, :region, :days_to_ship, presence: true
  validates: :category_id, numericality: { other_than: 1 }
  validates: :item_status_id, numericality: { other_than: 1 }
  validates: :fee_shipping_id, numericality: { other_than: 1 }
  validates: :region_id, numericality: { other_than: 1 }
  validates: :days_to_ship_id, numericality: { other_than: 1 }
end
