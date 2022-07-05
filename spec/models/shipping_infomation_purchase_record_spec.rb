require 'rails_helper'
RSpec.describe ShippingInfomationPurchaseRecord, type: :model do
  describe '購入記録及び発送者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @shipping_infomation_purchase_record = FactoryBot.build(:shipping_infomation_purchase_record, user_id: user.id,
                                                                                                    item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@shipping_infomation_purchase_record).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @shipping_infomation_purchase_record.building = ''
        expect(@shipping_infomation_purchase_record).to be_valid
      end
      it 'phone_numberは10桁でも保存できること' do
        @shipping_infomation_purchase_record.phone_number = '1234561111'
        expect(@shipping_infomation_purchase_record).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @shipping_infomation_purchase_record.postal_code = ''
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @shipping_infomation_purchase_record.postal_code = '1234567'
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeに半角数字以外を入力したとき' do
        @shipping_infomation_purchase_record.postal_code = 'aaa-bbbb'
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @shipping_infomation_purchase_record.prefecture_id = '1'
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村を入力していないと保存できないこと' do
        @shipping_infomation_purchase_record.municipalities = ''
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'adoressが入力していないと保存できないこと' do
        @shipping_infomation_purchase_record.address = ''
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力していないと保存できないこと' do
        @shipping_infomation_purchase_record.phone_number = ''
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンを入れて入力しても保存できないこと' do
        @shipping_infomation_purchase_record.phone_number = '090-9999-9999'
        @shipping_infomation_purchase_record.valid?
        expect(@shipping_infomation_purchase_record.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
