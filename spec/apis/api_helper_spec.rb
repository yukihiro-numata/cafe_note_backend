require 'rails_helper'

describe 'APIHelper' do
  let!(:dummy_class) { Class.new { extend APIHelper } }

  describe 'current_user' do
    subject { dummy_class.current_user }
    context '正常系' do
      let!(:user) { create(:user) }
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
        before do
          allow(dummy_class).to receive(:bearer_token).and_return(nil)
        end
        it 'nilが返ること' do
          expect(subject).to eq nil
        end
      end
    end
  end
end
