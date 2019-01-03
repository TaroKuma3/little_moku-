class MokusController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user

  def index
    # 絞り込み用を書く
    if params[:moku_type]
      @user = current_user
      # @moku_type = MokuType.where(id: params[:id])
      @mokus = Moku.where(user_id: current_user.id).where(moku_type_id: params[:moku_type])
    else
      @user = current_user
      @mokus = Moku.where(user_id: @user.id)
    end
  end

  def show
    @user = current_user
    @moku = Moku.find(params[:id])
    @moku_type = MokuType.find(@moku.moku_type_id)
    @works = Work.where(moku_id: @moku.id)
  end

  def new
    @user = current_user
    @moku_types = MokuType.where(user_id: @user.id)
  end

  def create
    @moku = Moku.new(
      user_id: current_user.id,
      moku_type_id: params[:moku_type],
      mjn_public: params[:mjn_public],
    )

    if @moku.save
      flash[:notice] = "MOKU開始！頑張って！"
      redirect_to(mypage_path)
    else
      render action: :new
    end
  end

  def edit
    @user = current_user
    @moku = Moku.find(params[:id])
    # @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    # @works = Work.where(moku_id: @moku.id)
  end

  def update
    user = current_user
    @moku = Moku.find(params[:id])
    @moku.content = params[:moku][:content]
    @moku.mjn_public = params[:moku][:mjn_public]

    moku_type = MokuType.find(params[:moku][:moku_type])
    @moku.moku_type = moku_type

    if @moku.save!
      flash[:notice] = "更新しました！"
    else
      render action: :edit
    end

    redirect_to action: :show, user_id: user.id, id: @moku.id
  end

end