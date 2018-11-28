class MokuTypeController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @moku_type = MokuType.where(user_id: params[:user_id])
  end

  def show
    @moku_type = MokuType.find_by(id: params[:id])
    @mokus = Moku.where(moku_type_id: @moku_type.id)
  end

  def edit
    @moku_type = MokuType.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end
end
