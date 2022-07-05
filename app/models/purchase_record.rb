class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :sipping_information
end
