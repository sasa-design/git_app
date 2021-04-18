require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー管理テスト" do
    it "全ての項目を入力した場合ログイン可能" do
      expect(@user).to be_valid
    end
    it "メールアドレスの入力がない場合エラー" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが他の人と被った場合はエラー" do
      @user.save
      other_user = FactoryBot.build(:user)
      other_user.email = @user.email
      other_user.valid?
      expect(other_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'パスワードがない場合はエラー' do
      @user.password_digest = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'メールアドレスに@がない場合はエラー' do
      @user.email = 'aaaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
  end
end
