class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def show
    render json: { status: 'SUCCESS', message: 'Loaded the user', data: @user }
  end

  def create
    user = User.new(post_params)
    render json: user.save ? { status: 'SUCCESS', data: user } : { status: 'ERROR', data: user.errors }
  end

  def destroy
    @user.destroy
    render json: { status: 'SUCCESS', message: 'Deleted the user', data: @user }
  end

  def update
    render json: @user.update(post_params) ? { status: 'SUCCESS', message: 'Update the user', data: @user } : { status: 'SUCCESS', message: 'Not updated', data: @user.errors }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def post_params
    params.require(:user).permit(:user_name, :tel, :email)
  end
end
