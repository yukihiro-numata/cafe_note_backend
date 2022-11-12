require 'rails_helper'

describe 'api users', :type => :request do
  describe 'post' do
    subject { post '/users', params: { firebase_uid: 'uid', email: email } }
    context '正常系' do
      let!(:email) { 'user@example.com' }
      it 'リクエストに成功すること' do
        expect { subject }.to change(User, :count).by(1)
        expect(response).to have_http_status 201
        expect(response.body).to be_json_including(
          {
            'id' => Integer,
            'firebase_uid' => String,
            'email' => String,
          }
        )
      end
    end
  end
end
