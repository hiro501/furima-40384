class Item < ApplicationRecord
  belongs_to :user

  validates :price, presence: true
  validates :item_name, presence: true
  validates :description_id, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_day_id, presence: true
  validates :image, presence: true
end
