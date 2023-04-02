require 'rails_helper'

describe 'api cafes', type: :request do
  describe 'get' do
    describe 'list' do
      subject { get '/cafes' }
      context '正常系' do
        let!(:cafe_1) do
          create(:cafe).tap do |c|
            create(:cafe_address, cafe: c)
            create(:cafe_medium, cafe: c)
          end
        end
        let!(:cafe_2) do
          create(:cafe).tap do |c|
            create(:cafe_address, cafe: c)
            create(:cafe_medium, cafe: c)
          end
        end
        it 'リクエストに成功すること' do
          subject
          expect(response).to have_http_status 200
          expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
            [
              {
                'id' => Integer,
                'name' => String,
                'nearest_station' => String,
                'transportation' => String,
                'business_hours' => String,
                'regular_holiday' => String,
                'can_takeout' => boolean,
                'has_parking' => boolean,
                'has_wifi' => boolean,
                'has_power_supply' => boolean,
                'can_smoking' => boolean,
                'img_path' => String,
                'cafe_address' => {
                  'id' => Integer,
                  'cafe_id' => Integer,
                  'post_code' => String,
                  'prefecture' => String,
                  'city' => String,
                  'address' => String,
                  'building' => String
                },
                'cafe_media' => [
                  {
                    'id' => Integer,
                    'cafe_id' => Integer,
                    'media_type' => String,
                    'url' => String
                  }
                ]
              }
            ]
          )
        end
      end
    end

    describe 'with id' do
      subject { get "/cafes/#{id}" }
      let!(:cafe_1) do
        create(:cafe).tap do |c|
          create(:cafe_address, cafe: c)
          create(:cafe_medium, cafe: c)
        end
      end
      let!(:cafe_2) do
        create(:cafe).tap do |c|
          create(:cafe_address, cafe: c)
          create(:cafe_medium, cafe: c)
        end
      end

      context '正常系' do
        let!(:id) { cafe_2.id }
        it '指定したデータ1件が取得できること' do
          subject
          expect(response).to have_http_status 200
          expect(JSON.parse(response.body)['data'].to_json).to be_json_including(
            {
              'id' => cafe_2.id,
              'name' => String,
              'nearest_station' => String,
              'transportation' => String,
              'business_hours' => String,
              'regular_holiday' => String,
              'can_takeout' => boolean,
              'has_parking' => boolean,
              'has_wifi' => boolean,
              'has_power_supply' => boolean,
              'can_smoking' => boolean,
              'img_path' => String,
              'cafe_address' => {
                'id' => Integer,
                'cafe_id' => Integer,
                'post_code' => String,
                'prefecture' => String,
                'city' => String,
                'address' => String,
                'building' => String
              },
              'cafe_media' => [
                {
                  'id' => Integer,
                  'cafe_id' => Integer,
                  'media_type' => String,
                  'url' => String
                }
              ]
            }
          )
        end
      end

      context '異常系' do
        context 'パラメータが不正な場合' do
          let!(:id) { 'invalid' }
          it 'データ取得できないこと' do
            subject
            expect(response).to have_http_status 400
          end
        end
        context '存在しないIDを指定した場合' do
          let!(:id) { 9999 }
          it 'データ取得できないこと' do
            subject
            expect(response).to have_http_status 404
          end
        end
      end
    end
  end

  describe 'post' do
    describe 'archive' do
      subject do
        post "/cafes/#{id}/archive",
             params: { rating: rating, memo: memo, visited_at: visited_at, image_paths: image_paths }
      end
      let!(:cafe) { create(:cafe) }

      context '正常系' do
        include_context 'user_authorized!'
        let!(:id) { cafe.id }
        let!(:rating) { 1 }
        let!(:memo) { 'test' }
        let!(:visited_at) { Time.zone.local(2022, 11, 15, 10, 0, 0) }
        let!(:image_paths) { %w[/sample1 /sample2] }
        it 'データ登録されること' do
          expect { subject }.to change(UserCafeArchive, :count).by(1).and change(UserCafeArchiveImage, :count).by(2)
          expect(response).to have_http_status 201
          archive = UserCafeArchive.find_by(user_id: user.id, cafe_id: id)
          expect(archive.rating).to eq 1
          expect(archive.memo).to eq 'test'
          expect(archive.visited_at).to eq Time.zone.local(2022, 11, 15, 10, 0, 0)
        end
      end

      context '異常系' do
        context 'パラメータが不正な場合' do
          include_context 'user_authorized!'
          let!(:id) { cafe.id }
          let!(:memo) { 'test' }
          where(:rating, :visited_at, :image_paths) do
            [
              [0, Time.zone.local(2022, 11, 15, 10, 0, 0), %w[/sample1 /sample2]],
              [1, 'invalid', %w[/sample1 /sample2]],
              [1, 1, %w[/sample1 /sample2]],
              [1, Time.zone.local(2022, 11, 15, 10, 0, 0), 'invalid']
            ]
          end
          with_them do
            it 'データ登録できないこと' do
              subject
              expect(response).to have_http_status 400
            end
          end
        end
        context '存在しないIDを指定した場合' do
          include_context 'user_authorized!'
          let!(:id) { 9999 }
          let!(:rating) { 1 }
          let!(:memo) { 'test' }
          let!(:visited_at) { Time.zone.local(2022, 11, 15, 10, 0, 0) }
          let!(:image_paths) { %w[/sample1 /sample2] }
          it 'データ登録できないこと' do
            subject
            expect(response).to have_http_status 404
          end
        end
        context '認証に失敗する場合' do
          let!(:id) { cafe.id }
          let!(:rating) { 1 }
          let!(:memo) { 'test' }
          let!(:visited_at) { Time.zone.local(2022, 11, 15, 10, 0, 0) }
          let!(:image_paths) { %w[/sample1 /sample2] }
          it 'エラーが返ること' do
            subject
            expect(response).to have_http_status 401
          end
        end
      end
    end
  end
end
