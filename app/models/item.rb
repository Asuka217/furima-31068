class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :image,        presence: true
  validates :title,        presence: true
  validates :explication,  presence: true
  validates :price,        presence: true, numericality: { greater_than: 300, less_than: 9999999 }
  validates :category,     presence: true
  validates :item_status,  presence: true
  validates :fee_shipping, presence: true
  validates :region,       presence: true
  validates :days_to_ship, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :fee_shipping
  belongs_to_active_hash :region
  belongs_to_active_hash :days_to_ship

  validates :category_id, numericality: { other_than: 1 }
  validates :item_status_id, numericality: { other_than: 1 }
  validates :fee_shipping_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :days_to_ship_id, numericality: { other_than: 1 }
end