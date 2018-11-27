class MokusController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @mokus = Moku.where(user_id: params[:user_id])
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    @works = Work.where(moku_id: @moku.id)
  end

  def edit
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    @works = Work.where(moku_id: @moku.id)
  end


end