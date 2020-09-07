require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameは必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname 入力が正しくありません。')
    end
    it 'メールアドレスは必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性である事' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは@を含む' do
      @user.email = 'aaaabbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードは必須' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは6文字以上' do
      @user.password = 'ps000'
      @user.password_confirmation = 'ps000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードが数字のみでは不可' do
      @user.password = '12345678'
      @user.password_confirmation = '12345678'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'パスワードが英字だけでは不可' do
      @user.password = 'aaaacccc'
      @user.password_confirmation = 'aaaacccc'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it '確認用パスワードも入力されている' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Password confirmation 入力が正しくありません。')
    end
    it '生年月日が必須' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Birth date 入力が正しくありません。')
    end
    it '苗字が必要' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name 入力が正しくありません。')
    end
    it '名前が必要' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name 入力が正しくありません。')
    end
    it '苗字のカナが必要' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana 入力が正しくありません。')
    end
    it '名前のカナが必要' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana 入力が正しくありません。')
    end
    it '苗字のカナが全角でなければならない' do
      @user.last_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
    it '名前のカナが全角でなければならない' do
      @user.first_name_kana = 'ｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end
    it '苗字に英字が使えない' do
      @user.last_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前に英字が使えない' do
      @user.first_name = 'abcd'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '苗字に数字が使えない' do
      @user.last_name = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前に数字が使えない' do
      @user.first_name = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    it '苗字に記号が使えない' do
      @user.last_name = '!?+_'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end
    it '名前に記号が使えない' do
      @user.first_name = '!?/_'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
  end
end
