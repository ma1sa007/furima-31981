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

        it "メールアドレスが必須であること" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "メールアドレスは、@を含む必要があること" do
          @user.email = "sample.co.jp"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "重複したemailが存在する場合登録できない" do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it "パスワードが必須であること" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it "パスワードは、6文字以上での入力が必須であること" do
          @user.password = "aA1"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end


        it "パスワードとパスワード（確認用）、値の一致が必須であること" do
          @user.password_confirmation = "0000aa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "ユーザー本名は、名字がそれぞれ必須であること" do
          @user.first_name =""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end

        it "ユーザー本名は、名前がそれぞれ必須であること" do
          @user.last_name =""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end

        it "ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
          @user.first_name = ("jjj")
          @user.valid?
          expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end

        it "ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
          @user.last_name, = ("jjj")
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
        end

        it "ユーザー本名のフリガナは、名字でそれぞれ必須であること" do
          @user.first_name_kana = ("jjj")
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
        end

        it "ユーザー本名のフリガナは、名前で必須であること" do
          @user.last_name_kana = ("jjj")
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
        end


        it "ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること" do
          @user.first_name_kana = "jjj"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana 全角文字を使用してください")
        end

        it "ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること" do
          @user.last_name_kana = "jjj"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana 全角文字を使用してください")
        end

        it "生年月日が必須であること" do
          @user. birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end


        it "数字のみでは登録できないこと" do
          @user.password = "1111111"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "全角では登録できないこと" do
          @user.password ="ああああああ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "英語のみでは登録できない事" do
          @user.password ="aaaaaaa"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it "全角英数字混合では登録できない事" do
          @user.password ="ＡＢＣ１２３"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
   end
end