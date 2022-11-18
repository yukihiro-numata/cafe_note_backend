require 'rails_helper'

describe 'api user cafe archives', type: :request do
  describe 'get' do
    describe 'list' do
      subject { get '/user_cafe_archives', params: { user_id: user_1.id } }
      let!(:cafe) { create(:cafe) }
      let!(:user_1) { create(:user, email: 'aaa@example.com') }
      let!(:user_2) { create(:user, email: 'bbb@example.com') }
      let!(:cafe_archives_1) { create(:user_cafe_archive, cafe: cafe, user: user_1) }
      let!(:cafe_archives_2) { create(:user_cafe_archive, cafe: cafe, user: user_2) }
      let!(:cafe_archives_3) { create(:user_cafe_archive, cafe: cafe, user: user_1) }
      context '正常系' do
        it 'データ取得できること' do
          subject
          expect(response).to have_http_status 200
          expect(response.body).to be_json_including(
            [
              {
                'id' => Integer,
                'cafe_id' => Integer,
                'rating' => Integer,
                'memo' => String,
                'visited_at' => String
              }
            ]
          )
        end
        it '特定のユーザーに紐づくデータのみ取得できること' do
          subject
          result = JSON.parse(response.body).map { |v| v['id'] }
          expect(result).to contain_exactly(cafe_archives_1.id, cafe_archives_3.id)
          expect(result).not_to contain_exactly(cafe_archives_2.id)
        end
      end
    end
  end
end
