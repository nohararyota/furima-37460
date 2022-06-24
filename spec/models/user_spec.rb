require 'rails_helper'


  RSpec.describe User,type: :model do
    describe  "新規登録テスト"do
      before do
        @user = FactoryBot.build(:user)
      end
  

      context "登録できる場合"do
      it "正しい入力で登録ができること" do
        expect(@user).to be_valid
      end
      end

      context "登録できない場合"do
      it "ニックネームが空であると登録できない" do
        @user.nick_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nick name can't be blank")
      end
      it "emailが空であると登録できない"do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailがある場合は登録できない"do
        @user.save
        another_user =FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がないと登録できない"do
        @user.email = 'aaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "パスワードがない場合登録できない"do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "パスワードが6文字未満の場合登録できない"do
        @user.password = 'a1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "パスワードが英数字混合の場合でないと登録できない"do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードが英文字のみ場合登録できない"do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードが数字のみの場合登録できない"do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードが全角文字を含む場合登録できない"do
        @user.password = 'あああああ１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "パスワードがあってもパスワード確認がない場合登録できない"do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameがない場合登録ができない"do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end
      it "last_nameが全角でない場合登録できない"do
        @user.last_name = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameがない場合登録ができない"do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でない場合登録できない"do
      @user.first_name = 'ｹﾝﾀ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_name_katakanaがない場合登録ができない"do
        @user.last_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end
      it "last_name_katakanaが全角カタカナでない場合登録できない"do
        @user.last_name_katakana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end
      it "first_name_katakanaがない場合登録ができない"do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end
      it "first_name_katakanaが全角カタカナでない場合登録できない"do
        @user.first_name_katakana = 'ｹﾝﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end
      it "date_of_bathがない場合登録ができない"do
        @user.date_of_bath = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of bath can't be blank")
      end
      end
    end
  end

