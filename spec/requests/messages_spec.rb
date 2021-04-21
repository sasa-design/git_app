require 'rails_helper'

RSpec.describe "Api::Messages", type: :request do
    # describe 'GET /api/messages/:id' do
    #    let(:user){FactoryBot.create(:user)}
    #    let(:id){FactoryBot.create(:user)}
    #    let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
    #    let(:headers) {{Authorization: "Bearer #{token}"}}
    #    let(:message){FactoryBot.create(:message, user: user)}
    #   it 'messagesの一覧を取得できること' do
    #        get api_message_path(id), headers: headers
    #        expect(response).to have_http_status(200)
    #        json = JSON.parse(response.body)
    #        expect(json).to include({
    #            'id' => message.id,
    #            'user' =>  {'id' => user.id, 'email' => user.email, 'name' => user.name}
    #        })
    #   end 
    # end

    describe 'POST /api/messages' do
        let(:user){FactoryBot.create(:user)}
        let(:token) {Jwt::TokenProvider.call(user_id: user.id)}
        let(:headers) {{Authorization: "Bearer #{token}"}}
        let(:message_params) {{message: {receiver_id: 2, content: 'aaa'}}}
        it 'messageが作成できること' do
            post api_messages_path, params: message_params, headers: headers
            expect(response).to have_http_status(200)
            json = JSON.parse(response.body)
            expect(json).to include({
                'sender_id' => user.id,
                'receiver_id' => 2,
                'content' => 'aaa',
            })
        end
    end
end
