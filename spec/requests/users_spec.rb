require 'rails_helper'

RSpec.describe "Api::Users", type: :request do
  describe 'POST /api/users' do
    let(:user_params) do
      { user: { name: 'test', email: 'test@example.com', password: '123456789'} }
    end
    it '登録が成功すること' do
      post api_users_path, params: user_params
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json).to include ({
        'id' => be_present,
        'name' => 'test',
        'email' => 'test@example.com'
      })
    end
  end
  describe 'GET /api/users/:id' do
    let(:user) { FactoryBot.create(:user) }
    it 'ユーザーの詳細が取得できること' do
      get api_user_path(user)
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json).to include({
        'id' => user.id,
        'name' => user.name,
        'email' => user.email,
      })
    end
  end
end
