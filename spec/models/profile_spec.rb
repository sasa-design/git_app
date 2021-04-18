require 'rails_helper'

RSpec.describe Profile, type: :model do
  before do
    @profile = FactoryBot.build(:profile)
  end
  describe "proifleモデルのテスト" do
    it "適切に入力されていれば登録できる" do
      expect(@profile).to be_valid
    end
    # it "detailが200文字以上の場合はエラー" do
    #   @profile.detail = ""
    #   @profile.valid?
    #   expect(@profile.errors.full_messages).to include("Detail is too long (maximum is 200 characters)")
    # end
  end
end
