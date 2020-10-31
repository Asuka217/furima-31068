class BuyerInfo
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :region_id
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  validates :region_id, numericality: { other_than: 1 }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, region_id: region_id, city: city, address: address, building: building, telephone: telephone, buy_id: buy.id)
  end

end



