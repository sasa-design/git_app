require 'rails_helper'

RSpec.describe "Api::Mypage", type: :request do
    describe 'GET /api/mypage' do
        let(:user) {FactoryBot.create(:user)}
        let(:headers) {{Authorization: "Bearer #{token}"}}
        let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
        context 'createの場合' do
            it 'profileの一覧が作成できること' do
                get api_mypage_index_path ,headers: headers
                expect(response).to have_http_status(200) 
                json = JSON.parse(response.body)
                expect(json).to include({
                    'user' => {'id' => user.id, 'email' => user.email, 'name' => user.name}
                })
            end
        end
        context 'find_byの場合' do
            let(:profile) {FactoryBot.create(:profile)}
            it 'profileの一覧が所得できること' do
                get api_mypage_index_path, headers:headers
                expect(response).to have_http_status(200)
                expect(JSON.parse(response.body)).to include({
                    'user' => {'id' => user.id, 'email' => user.email, 'name' => user.name}
                })
            end
        end
    end
    # describe 'GET /api/mypage/:id' do
    #    let(:user){FactoryBot.create(:user)}
    #    it 'profileの詳細を取得できること' do
    #        get api_mypage_path(user)
    #        expect(response).to have_http_status(200)
    #        json = JSON.parse(response.body)
    #        expect(json).to include({
    #            'id' => profile.id,
    #            'user' => {'id' => profile.user.id, 'name' => profile.user.name ,'email' => profile.user.email}
    #        })
    #    end
    # end
    describe 'PUT /api/mypage/:id' do
        let(:user) {FactoryBot.create(:user)}
        let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
        let(:headers) {{Authorization: "Bearer #{token}"}}
        let(:profile) {FactoryBot.create(:profile, user: user)}
        let(:profile_params) {{profile: { age: '22'}}}
        context 'ログイン済みの場合' do
            it 'マイクロポストが更新できること' do
                put api_mypage_path(user), params: profile_params, headers: headers
                expect(response).to have_http_status(200)
                json = JSON.parse(response.body)
                expect(json).to include({
                    'age' => 22,
                    'user' => {'id' => user.id, 'email' => user.email, 'name' => user.name}
                })
            end
        end
    end
end
