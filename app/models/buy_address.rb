class BuyAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :municipalities, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities
    validates :block
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/}
    validates :token
  end
  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, block: block, building_name: building_name, phone_number: phone_number, buy_id: buy.id)
  end
end