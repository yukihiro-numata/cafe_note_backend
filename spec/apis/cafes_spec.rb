require 'rails_helper'

describe 'api cafes', :type => :request do
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
          expect(response.body).to be_json_including(
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
                  'building' => String,
                },
                'cafe_media' => [
                  {
                    'id' => Integer,
                    'cafe_id' => Integer,
                    'media_type' => String,
                    'url' => String,
                  },
                ],
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
          expect(response.body).to be_json_including(
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
                'building' => String,
              },
              'cafe_media' => [
                {
                  'id' => Integer,
                  'cafe_id' => Integer,
                  'media_type' => String,
                  'url' => String,
                },
              ],
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
end
