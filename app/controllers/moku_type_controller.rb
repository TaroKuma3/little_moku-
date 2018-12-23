class MokuTypeController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @moku_types = MokuType.where(user_id: @user.id)
  end

  def show
    @moku_type = MokuType.find_by(id: params[:id])
    @mokus = Moku.where(moku_type_id: @moku_type.id)
  end

  def new
    @user = User.find_by(id: current_user.id)
    @moku_types = MokuType.where(user_id: @user.id)

  end

  def create
    @user = User.find_by(id: current_user.id)

    moku_type = MokuType.new(
      name: params[:name],
      user_id: current_user.id,
    )
    moku_type.save!
    redirect_to(user_moku_type_index_path(@user))
  end

  def edit
    @user = User.find_by(id: current_user.id)
    @moku_types = MokuType.where(user_id: @user.id)
    @moku_type = MokuType.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: current_user.id)
    moku_type = MokuType.find_by(id: params[:id])
    moku_type.name = params[:name]
    moku_type.user_id = current_user.id

    moku_type.save!
    redirect_to(user_moku_type_index_path(@user))


  end

end
