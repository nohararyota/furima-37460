class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :days_to_ship
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :situation
  belongs_to :user
  has_one_attached :image
  has_one :purchase_record

  validates :product_name,          presence: true
  validates :description_of_item,   presence: true
  validates :image,                 presence: true

  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end

  validates :category_id,         numericality: { other_than: 1, message: "can't be blank" }
  validates :situation_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,       numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id,     numericality: { other_than: 1, message: "can't be blank" }
end
