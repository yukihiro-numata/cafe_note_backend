require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    subject { User.create!(firebase_uid: firebase_uid, email: email) }
    context 'email' do
      let!(:firebase_uid) { 'uid' }
      context '正常系' do
        let!(:email) { 'email@example.com' }
        it '登録できること' do
          expect { subject }.to change(User, :count).by(1)
        end
      end

      context '異常系' do
        context 'メールアドレス形式になっていない場合' do
          where(:email) { %w[invalid invalid@example @example.com] }
          with_them do
            it 'エラーになること' do
              expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
            end
          end
        end

        context '同じメールアドレスのユーザーが既に登録されている場合' do
          let!(:email) { 'email@example.com' }
          let!(:user) { create(:user, email: email) }
          it 'エラーになること' do
            expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
          end
        end
      end
    end
  end
end
