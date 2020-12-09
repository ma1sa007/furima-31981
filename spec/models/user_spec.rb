require 'rails_helper'
RSpec.describe User, type: :model  do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it " first_nameとlast_name、first_name_kanaとlast_name_kana,passwordとpassword_confirmation,email,birthdayが存在すれば登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
        @user.password = "0000aa"
        @user.password_confirmation = "0000aa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it " first_nameとlast_name、first_name_kanaとlast_name_kana,passwordとpassword_confirmation,email,birthdayが空だと登録できない" do 
      end
  end
end