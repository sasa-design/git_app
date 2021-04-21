require 'rails_helper'

RSpec.describe "Api::Sessions", type: :request do
    describe  'POST /api/sessions' do
        let(:user) { FactoryBot.create(:user) }
        context '認証情報が正しい場合' do
            let(:session_params) do
                { session: { email: user.email, password: '123456789' }}
            end
            it 'ログインに成功すること' do
                post api_sessions_path, params: session_params
                expect(response).to have_http_status(200)
                json = JSON.parse(response.body)
                expect(json).to include({
                    'id' => user.id,
                    'name' => user.name,
                    'email' => user.email,
                    'user' => be_present
                })
            end
        end
        context '認証情報に誤りがある場合' do
            let(:invalid_session_params) do
                { session: { email: user.email, password: '1234' }}
            
            end    
            it 'ログインに成功すること' do
                post api_sessions_path, params: invalid_session_params
                expect(response).to have_http_status(401)
                json = JSON.parse(response.body)
                expect(json).to be_present
            end
        end
    end
end
