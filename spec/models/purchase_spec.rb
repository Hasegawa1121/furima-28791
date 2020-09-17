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

    context 'ユーザー新規登録がうまくいかない場合' do
      it 'nicknameは必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname 入力が正しくありません。')
      end
      it ''

    end

  end



end