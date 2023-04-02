require 'rails_helper'

describe 'api users', type: :request do
  describe 'post' do
    subject { post '/users', params: { firebase_uid: 'uid', email: email } }
    context '正常系' do
      let!(:email) { 'user@example.com' }
      it 'リクエストに成功すること' do
        expect { subject }.to change(User, :count).by(1)
        expect(response).to have_http_status 201
        expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
          {
            'id' => Integer,
            'firebase_uid' => String,
            'email' => String
          }
        )
      end
    end
  end

  describe 'get' do
    subject { get '/users' }
    context '正常系' do
      include_context 'user_authorized!'
      it 'データ取得できること' do
        subject
        expect(response).to have_http_status 200
        expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
          {
            'id' => Integer,
            'firebase_uid' => String,
            'email' => String
          }
        )
      end
    end
    context '異常系' do
      it 'エラーが返ること' do
        subject
        expect(response).to have_http_status 401
      end
    end
  end
end
