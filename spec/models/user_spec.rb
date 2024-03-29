require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000001'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "kanji_last_nameが空では登録できない" do
        @user.kanji_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji last name can't be blank")
      end
      it "kanji_first_nameが空では登録できない" do
        @user.kanji_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanji first name can't be blank")
      end
      it "katakana_last_nameが空では登録できない" do
        @user.katakana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana last name can't be blank")
      end
      it "katakana_first_nameが空では登録できない" do
        @user.katakana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Katakana first name can't be blank")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it "kanji_last_nameがひらがな・カタカナ・漢字のみでないと登録できない" do
        @user.kanji_last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji last name is invalid')
      end

      it "kanji_first_nameがひらがな・カタカナ・漢字のみでないと登録できない" do
        @user.kanji_first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanji first name is invalid')
      end

      it "katakana_last_nameがカタカナのみでないと登録できない" do
        @user.katakana_last_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana last name is invalid')
      end

      it "katakana_first_nameがカタカナのみでないと登録できない" do
        @user.katakana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Katakana first name is invalid')
      end
      it "passwordに全角を含んでいると登録できない" do
        @user.password = 'パスワード１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end