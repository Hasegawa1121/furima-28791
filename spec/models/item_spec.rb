require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいく場合' do
      it '全ての入力が正しい場合登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかない場合' do
      it '画像が必要' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必要' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が必要' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリー選択が必要' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品の状態の選択が必要' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 0')
      end
      it '配送料の負担についての情報が必要' do
        @item.postage_payer_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 0')
      end
      it '発送元の地域についての情報が必要' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it '発送までの日数についての情報が必要' do
        @item.handling_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Handling must be other than 0')
      end
      it '価格についての情報が必要' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は半角数字のみ' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が¥300以下だと出品できない' do
        @item.price = 250
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が¥9,999,999以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
