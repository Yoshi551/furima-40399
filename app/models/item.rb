class Item < ApplicationRecord

  validates :name,                presence: true
  validates :description,         presence: true
  validates :price,               presence: true,  numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to:9999999 }
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_fee_id,     presence: true
  validates :prefecture_id,       presence: true
  validates :shipping_day_id,     presence: true
  validates :image,               presence: true

  belongs_to :user
  has_one_attached :image

end
