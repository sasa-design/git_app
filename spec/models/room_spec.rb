require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe "roomモデルのテスト" do
    it "適切に入力されていれば登録できる" do
      expect(@room).to be_valid
    end
    it "dateが空の場合はエラー" do
      @room.date = ""
      @room.valid?
      expect(@room.errors.full_messages).to include("Date can't be blank")
    end
    # it 'commentが140文字以上の場合はエラー' do
    #  @micropost.title = ''
    #  @micropost.valid?
    #  expect(@micropost.errors.full_messages).to include('Comment is too long (maximum is 30 characters)')
    # end
  end
end
