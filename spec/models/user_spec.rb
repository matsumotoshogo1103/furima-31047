require 'rails_helper'

describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録がうまくいく時' do
    it '正しい値が入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context 'ユーザー新規登録がうまくいかない時' do
    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'abcdefg'
      @user.password_confirmation = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is invalid'
    end

    it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
      @user.password = '123abc'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'ユーザー本名は、名字が必須であること' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'ユーザー本名は、名前が必須であること' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'ユーザー本名（苗字）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end

    it 'ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end

    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'ユーザー本名（名前）のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_kana = 'ひらがな'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'ユーザー本名（苗字）のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_kana = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end

    it '生年月日が必須であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
