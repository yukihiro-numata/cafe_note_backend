require 'rails_helper'

describe 'APIHelper' do
  let!(:dummy_class) { Class.new { extend APIHelper } }

  describe 'current_user' do
    subject { dummy_class.current_user }
    let!(:user) { create(:user) }

    context '正常系' do
      before do
        decoded_result = [{ 'user_id' => user.firebase_uid }]
        allow(JWT).to receive(:decode).and_return(decoded_result)
        allow(dummy_class).to receive(:bearer_token).and_return('token')
      end
      it 'ユーザーが取得できること' do
        expect(subject).to eq user
      end
    end

    context '異常系' do
      context 'bearer tokenが取得できない場合' do
        before { allow(dummy_class).to receive(:bearer_token).and_return(nil) }
        it 'nilが返ること' do
          expect(subject).to eq nil
        end
      end

      context 'bearer tokenに紐づくユーザーが見つからない場合' do
        before do
          decoded_result = [{ 'user_id' => 'invalid user id' }]
          allow(JWT).to receive(:decode).and_return(decoded_result)
          allow(dummy_class).to receive(:bearer_token).and_return('token')
        end
        it 'ActiveRecord::RecordNotFoundがraiseされること' do
          expect {subject}.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
