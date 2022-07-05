class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    @shipping_infomation_purchase_record = ShippingInfomationPurchaseRecord.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_infomation_purchase_record = ShippingInfomationPurchaseRecord.new(shipping_infomation_purchase_record_params)
    if @shipping_infomation_purchase_record.valid?
      pay_item
      @shipping_infomation_purchase_record.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def shipping_infomation_purchase_record_params
    params.require(:shipping_infomation_purchase_record).permit(:postal_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :purchase_record).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item[:price],
      card: shipping_infomation_purchase_record_params[:token],
      currency: 'jpy'
    )
  end
end
