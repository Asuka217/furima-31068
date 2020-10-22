require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空欄だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空欄だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@は必須' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'emailが重複していると登録できない' do
        @user.save
        user1 = FactoryBot.build(:user)
        user1.email = @user.email
        user1.valid?
        expect(user1.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空欄だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは5文字以下' do
        @user.password = 'kuma1'
        @user.password_confirmation = 'kuma1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみだと、登録できない' do
        @user.password = 'kumakuma'
        @user.password_confirmation = 'kumakuma'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'Passwordが半角数字のみだと、登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = '1234567'
        @user.invalid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordはpassword_confirmationのどちらも入力されていないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'first_nameとlast_nameでそれぞれ入力がないと登録できない' do
        @user.first_name = '太郎'
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_nameとlast_nameは全角のカナ/かな/漢字のどれかでの入力が必要' do
        @user.first_name = '太郎'
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'fist_name_kanaとlast_name_kanaはそれぞれ入力がないと登録できない' do
        @user.first_name_kana = 'タロウ'
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaとlast_name_kanaはカタカナでの入力が必要' do
        @user.first_name_kana = 'タロウ'
        @user.last_name_kana = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'birthdayは空欄では登録ができない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
