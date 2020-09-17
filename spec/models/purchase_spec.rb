require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    # binding.pry
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id, image: fixture_file_upload('public/images/test_image.png') )
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
  end

  describe '住所登録' do

    context '住所登録がうまくいく場合' do
      it '全ての入力が正しい場合登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '住所登録がうまくいかない場合' do
      it '郵便番号が必須' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンが必要' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が必須' do
        @purchase.prefecture_id = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it '市区町村が必須' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須' do
        @purchase.addresses = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が必須' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号はハイフンが不要" do
        @purchase.phone_number = '080-1234-5678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
      it "電話番号は11文字以内" do
        @purchase.phone_number = '080123456789'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid")
      end
    end

  end

end