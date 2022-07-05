class ShippingInfomationPurchaseRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :purchase_record, :user_id,
                :item_id, :token

  VALID_POSTAL_CODE_REGEX = /\A\d{3}-\d{4}\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipalities,     presence: true
  validates :address,            presence: true
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :token, presence: true

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingInfomation.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities,
                              address: address, building: building, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
