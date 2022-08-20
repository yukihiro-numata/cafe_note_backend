class CafesController < ApplicationController
  def index
    cafes = Cafe.includes([:cafe_address, :cafe_media]).order(created_at: :desc)
    render_200_with_array(array_data: cafes, serializer: CafeSerializer)
  end

  def show
    cafe = Cafe.find(params[:id])
    render_200(data: cafe, serializer: CafeSerializer)
  end

  def create
    begin
      cafe_form = CafeForm.new(cafe_params)
      if cafe_form.invalid?
        render_400
        return
      end

      cafe = cafe_form.save!
      render_200(data: cafe, serializer: CafeSerializer)
    rescue => e
      logger.error('Could not create cafe.')
      logger.error(e)
      render_500
    end
  end

  private

  def cafe_params
    params.permit(
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
      :img_path,
      :post_code,
      :prefecture,
      :city,
      :address,
      :building,
      medium: [
        :media_type,
        :url,
      ],
    )
  end

  # TODO: 共通のヘルパーに移動する
  def render_200_with_array(array_data:, serializer:)
    render json: array_data, root: 'data', adapter: :json, each_serializer: serializer, status: :ok
  end

  def render_200(data:, serializer:)
    render json: data, root: 'data', adapter: :json, serializer: serializer, status: :ok
  end

  def render_400
    render json: { status: 'ERROR', message: 'Invalid Parameter' }, status: :bad_request
  end

  def render_500
    render json: { status: 'ERROR', message: 'Could not create cafe' }, status: :internal_server_error
  end
end
