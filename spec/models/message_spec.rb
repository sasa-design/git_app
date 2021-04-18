require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe "messageモデルのテスト" do
    it "適切に入力されていれば登録できる" do
      expect(@message).to be_valid
    end
    it "contentが空の場合はエラー" do
      @message.content = ""
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
  end
end