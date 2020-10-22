class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :title
    validates :explication
    validates :category
    validates :item_status
    validates :fee_shipping
    validates :region
    validates :days_to_ship
    validates :price, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :fee_shipping
  belongs_to_active_hash :region
  belongs_to_active_hash :days_to_ship

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :fee_shipping_id
    validates :region_id
    validates :days_to_ship_id
  end
end
