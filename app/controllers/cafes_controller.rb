class CafesController < ApplicationController
  def index
    cafes = Cafe.includes([:cafe_address, :cafe_media]).order(created_at: :desc)
    render json: cafes, root: 'data', adapter: :json, each_serializer: CafeSerializer
  end

  def show
    cafe = Cafe.find(params[:id])
    render json: cafe, root: 'data', adapter: :json, serializer: CafeSerializer
  end

  def create
    begin
      ActiveRecord::Base.transaction do
        cafe = Cafe.create!(cafe_params)
        CafeAddress.create!(
          cafe: cafe,
          post_code: params[:post_code],
          prefecture: params[:prefecture],
          city: params[:city],
          address: params[:address],
          building: params[:building],
        )
        unless params[:media].nil?
          # TODO: bulk insertに変更
          params[:media].each do |media|
            CafeMedium.create!(cafe: cafe, media_type: media[:media_type], url: media[:url])
          end
        end
        render json: cafe, root: 'data', adapter: :json, serializer: CafeSerializer
      end
    rescue => e
      logger.error('Could not create cafe.')
      logger.error(e)
      render json: { status: "ERROR", message: "Could not create cafe" }, status: :internal_server_error
    end
  end

  private

  # TODO: バリデーション
  def cafe_params
    params
      .permit(
        :name,
        :nearest_station,
        :transportation,
        :business_hours,
        :regular_holiday,
        :can_takeout,
        :has_parking,
        :has_wifi,
        :has_power_supply,
        :can_smoking,
        :img_path
      )
  end
end
