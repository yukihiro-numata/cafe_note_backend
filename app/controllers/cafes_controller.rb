class CafesController < ApplicationController
  def index
    cafes = Cafe.includes(%i[cafe_address cafe_media]).order(created_at: :desc)
    render200_with_array(array_data: cafes, serializer: CafeSerializer)
  end

  def show
    cafe = Cafe.find(params[:id])
    render200(data: cafe, serializer: CafeSerializer)
  end

  def create
    cafe = CafeForm.new(cafe_params).save!
    render200(data: cafe, serializer: CafeSerializer)
  rescue ArgumentError
    render400
  rescue StandardError => e
    logger.error('Could not create cafe.')
    logger.error(e)
    render500
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
      medium: %i[
        media_type
        url
      ]
    )
  end
end
