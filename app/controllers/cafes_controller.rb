class CafesController < ApplicationController

  def index
    cafes = Cafe.order(created_at: :desc)
    render json: { status: "SUCCESS", message: "Loaded cafes", data: cafes }
  end

  def show
    cafe = Cafe.find(params[:id])
    render json: { status: "SUCCESS", message: "Loaded the cafe", data: cafe }
  end
end
