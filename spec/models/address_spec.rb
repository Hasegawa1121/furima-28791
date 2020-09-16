require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    order = FactoryBot.create(:order)
    @address = FactoryBot.build(:address, order_id: order.id)
  end

  describe '住所登録' do
    context '住所登録がうまくいく場合' do
      it '全ての入力が正しい場合登録できる' do
        expect(@address).to be_valid
      end
    end
  end

end