require 'rails_helper'

describe 'api user cafe archives', type: :request do
  include_context 'user_authorized!'

  describe 'get' do
    describe 'list' do
      subject { get '/user_cafe_archives' }
      let!(:cafe) { create(:cafe) }
      let!(:other_user) { create(:user, email: 'aaa@example.com') }
      let!(:cafe_archives_1) { create(:user_cafe_archive, cafe: cafe, user: user) }
      let!(:cafe_archives_2) { create(:user_cafe_archive, cafe: cafe, user: other_user) }
      let!(:cafe_archives_3) { create(:user_cafe_archive, cafe: cafe, user: user) }
      context '正常系' do
        it 'データ取得できること' do
          subject
          expect(response).to have_http_status 200
          expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
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
          result = JSON.parse(response.body)['data'].map { |v| v['id'] }
          expect(result).to contain_exactly(cafe_archives_1.id, cafe_archives_3.id)
          expect(result).not_to contain_exactly(cafe_archives_2.id)
        end
      end
    end

    describe 'with id' do
      subject { get "/user_cafe_archives/#{cafe_archive_id}" }
      let!(:other_user) { create(:user, email: 'aaa@example.com') }
      let!(:cafe) { create(:cafe) }
      let!(:cafe_archives_1) do
        create(:user_cafe_archive, user: user, cafe: cafe).tap do |a|
          create(:user_cafe_archive_image, user_cafe_archive: a)
        end
      end
      let!(:cafe_archives_2) do
        create(:user_cafe_archive, user: other_user, cafe: cafe).tap do |a|
          create(:user_cafe_archive_image, user_cafe_archive: a)
        end
      end
      context '正常系' do
        let!(:cafe_archive_id) { cafe_archives_1.id }
        it 'リクエストに成功すること' do
          subject
          expect(response).to have_http_status 200
        end
        it 'データ取得できること' do
          subject
          expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
            {
              'id' => Integer,
              'cafe_id' => Integer,
              'rating' => Integer,
              'memo' => String,
              'visited_at' => String,
              'user_cafe_archive_images' => [
                {
                  'id' => Integer,
                  'image_path' => String,
                }
              ],
            }
          )
          expect(JSON.parse(response.body)['data']['id']).to eq cafe_archives_1.id
        end
      end
      context '異常系' do
        context '存在しないIDが指定された場合' do
          let!(:cafe_archive_id) { 9999 }
          it '404が返ること' do
            subject
            expect(response).to have_http_status 404
          end
        end
        context '対象のユーザーでないユーザーのデータが指定された場合' do
          let!(:cafe_archive_id) { cafe_archives_2.id }
          it '404が返ること' do
            subject
            expect(response).to have_http_status 404
          end
        end
      end
    end
  end
end
