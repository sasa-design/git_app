require 'rails_helper'

RSpec.describe "API::Rooms", type: :request do
    describe 'GET /api/rooms' do
        let(:user){ FactoryBot.create(:user)}
        let(:rooms){ FactoryBot.create_list(:room,5)}
        let(:headers) {{Authorization: "Bearer #{token}"}}
        let(:token) { Jwt::TokenProvider.call(user_id: user.id)}
        it 'roomの一覧が所得できること' do
            get api_rooms_path, headers: headers
            expect(response).to have_http_status(200)
            expect(JSON.parse(response.body).length).to eq(0) 
        end
    end
    describe 'POST /api/rooms' do
        let(:user) {FactoryBot.create(:user)}
        let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
        let(:headers) {{Authorization: "Bearer #{token}"}}
        let(:rooms_params) {{room: { date: '2022/4/22' }}} 
        context 'ログイン済みの場合' do
            it 'roomが作成できること' do
                post api_rooms_path, params: rooms_params, headers: headers
                expect(response).to have_http_status(200)
                json = JSON.parse(response.body)
                expect(json).to include({
                    'date' => '2022-04-22',
                    'user' => {'id' => user.id, 'email' => user.email, 'name' => user.name}
                })
            end
        end
        # context 'ログインしていない場合' do
        #    it '401エラーになること' do
        #        post api_rooms_path, params: rooms_params, headers: headers
        #        expect(response).to have_http_status(401)
        #        json = JSON.parse(response.body)
        #        expect(json).to include({
        #            'messages' => be_present
        #        })
        #    end
        # end

        describe 'GET /api/rooms/:id' do
            let(:room) { FactoryBot.create(:room) }
            it 'マイクロポストの詳細を取得できること' do
                get api_room_path(room)
                expect(response).to have_http_status(200)
                json = JSON.parse(response.body)
                expect(json).to include({
                    'id' => room.id,
                    'area' => room.area,
                    'genre' => room.genre,
                    'artist' => room.artist,
                    'date' => '2021-04-14',
                    'time' => '2000-01-01T18:00:00.000Z',
                    'comment' => room.comment,
                    'user' => {'id' => room.user.id, 'name' => room.user.name ,'email' => room.user.email}
                })
            end
        end
        describe 'PUT /api/rooms/:id' do
            let(:user) {FactoryBot.create(:user)}
            let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
            let(:headers) {{Authorization: "Bearer #{token}"}}
            let(:room) {FactoryBot.create(:room, user: user)}
            let(:room_params) {{room: { date: '2022/4/22'}}}
            context 'ログイン済みの場合' do
                it 'マイクロポストが更新できること' do
                    put api_room_path(room), params: room_params, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json).to include({
                        'date' => '2022-04-22',
                        'user' => {'id' => user.id, 'email' => user.email, 'name' => user.name}
                    })
                end
            end
        # context 'ログインしていない場合' do
        #    it '401エラーになること' do
        #        put api_rooms_path, params: rooms_params, headers: headers
        #        expect(response).to have_http_status(401)
        #        json = JSON.parse(response.body)
        #        expect(json).to include({
        #            'messages' => be_present
        #        })
        #    end
        # end
        end
        describe 'DELETE /api/rooms/:id' do
            let(:user) {FactoryBot.create(:user)}
            let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
            let(:headers) {{Authorization: "Bearer #{token}"}}
            let(:room) {FactoryBot.create(:room, user: user)}
            let(:room_params) {{room: { date: '2022/4/22'}}}
            context 'ログイン済みの場合' do
                it 'マイクロポストが更新できること' do
                    delete api_room_path(room), params: room_params, headers: headers
                    expect(response).to have_http_status(200)
                    json = JSON.parse(response.body)
                    expect(json).to include({
                        'id' => room.id,
                    'area' => room.area,
                    'genre' => room.genre,
                    'artist' => room.artist,
                    'date' => '2021-04-14',
                    'time' => '2000-01-01T18:00:00.000Z',
                    'comment' => room.comment,
                    'user' => {'id' => room.user.id, 'name' => room.user.name ,'email' => room.user.email}
                    })
                end
            end
        # context 'ログインしていない場合' do
        #    it '401エラーになること' do
        #        delete api_rooms_path, params: rooms_params, headers: headers
        #        expect(response).to have_http_status(401)
        #        json = JSON.parse(response.body)
        #        expect(json).to include({
        #            'messages' => be_present
        #        })
        #    end
        # end
        end
    end
end 