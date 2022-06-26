require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能"do
  before do
    @item = FactoryBot.build(:item)
  end


  context "正しい情報で出品できる場合" do
      it "正しい入力で出品ができること" do
        expect(@item).to be_valid
      end
  end

  context "出品できない場合"do
    it "商品画像がない場合"do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名がない場合"do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")
    end
    it "商品説明がない場合"do
      @item.description_of_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description of item can't be blank")
    end
    it "カテゴリーが未選択（---）の場合"do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が未選択(---)の場合"do
      @item.situation_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Situation can't be blank")
    end
    it "配送料の負担が未選択(----)の場合"do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it "地域が未選択(---)の場合"do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数が未選択(---)の場合"do
      @item.days_to_ship_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end
    it "価格が空の場合"do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が300以下の場合"do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格が9,999,999を超える場合"do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
    it "価格に半角数値以外の文字を入力した場合"do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "ユーザーが紐づいていないと登録できない"do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
end
