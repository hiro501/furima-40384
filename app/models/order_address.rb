class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :user_id, :item_id

  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は3桁ハイフン4桁の形式で入力してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank"}
  validates :city, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true }, length: { minimum: 10, maximum: 11 }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    @order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building: building, phone_number: phone_number, order_id: order_id)
  end
end
