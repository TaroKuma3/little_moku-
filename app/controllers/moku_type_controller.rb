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
    @user = current_user
    @moku_type = MokuType.new
  end

  def create
    @user = User.find_by(id: current_user.id)

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
    @user = User.find_by(id: current_user.id)
    @moku_type = MokuType.find_by(id: params[:id])
    @moku_types = MokuType.where(user_id: @user.id)
  end

 def update
    @user = User.find_by(id: current_user.id)

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
