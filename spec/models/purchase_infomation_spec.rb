require 'rails_helper'
RSpec.describe User, type: :model  do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it " first_nameとlast_name、first_name_kanaとlast_name_kana,passwordとpassword_confirmation,email,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
        it "ニックネームが必須であること" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end