class MokuTypeController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user

  def index
    @user = current_user
    @moku_types = MokuType.where(user_id: @user.id)
  end

  def show
    @moku_type = MokuType.find_by(id: params[:id])
    @mokus = Moku.where(moku_type_id: @moku_type.id)
  end

  def new
    @user = current_user
    @moku_type = MokuType.new
  end

  def create
    @user = current_user

    @moku_type = MokuType.new(
      name: params[:name],
      user_id: current_user.id,
    )
    if @moku_type.save
      flash[:notice] = "新しいMOKUタグを登しました！"
      redirect_to(user_moku_type_index_path(@user))
    else
      render action: :new
    end
  end


  def edit
    @user = current_user
    @moku_type = MokuType.find_by(id: params[:id])
    @moku_types = MokuType.where(user_id: @user.id)
  end

 def update
    @user = current_user

    @moku_type = MokuType.find_by(id: params[:id])
    @moku_type.name = params[:name]
    @moku_type.user_id = current_user.id

    if @moku_type.save
      flash[:notice] = "更新しました！"
      redirect_to(user_moku_type_index_path(@user))
    else
      render action: :edit
    end
  end

end
