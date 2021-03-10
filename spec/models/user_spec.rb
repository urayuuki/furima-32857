require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'nickname,email,password,password_confirmation,全角、カナ（全角）生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@がない場合は登録できないこと ' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが数字のみの場合は登録できないこと' do
        @user.password = '1234567',
                         @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordがアルファベットのみだと登録できない' do
        @user.password = 'aaaaaa',
                         @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordとpassword_confirmationが一致していない場合は登録できないこと' do
        @user.password = '123abc',
                         @user.password_confirmation = '132acb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name last name cant be black')
      end
      it 'last_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end

      it 'first_nameが空の場合は登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name first name cant be black')
      end

      it 'first_nameが漢字、ひらがな、カタカナ以外では登録できない' do
        @user.first_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana last name kana cant be black')
      end

      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width characters')
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana first name kana cant be black')
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない' do
        @user.first_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width characters')
      end

      it 'birth_infoが空では登録できない' do
        @user.birth_info = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth info can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
