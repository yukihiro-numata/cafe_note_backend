class CafesController < ApplicationController

  def index
    cafes = Cafe.order(created_at: :desc)
    render json: { status: "SUCCESS", message: "Loaded cafes", data: cafes }
  end

  def show
    cafe = Cafe.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded the cafe", data: cafe }
  end

  def create
    cafe = Cafe.create!(cafe_params)
    render json: { status: "SUCCESS", message: "Created the cafe", data: cafe }
  end

  private
  def cafe_params
    params
      .require(:cafe)
      .permit(
        :name,
        :address,
        :nearest_station,
        :transportation,
        :business_hours,
        :regular_holiday,
        :can_takeout,
        :has_parking,
        :has_wifi,
        :has_power_supply,
        :can_smoking,
        :memo,
        :img_path,
        :tabelog_url
      )
  end
end
