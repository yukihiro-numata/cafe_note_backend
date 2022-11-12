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
  end
end
