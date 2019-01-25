class MokusController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only:[:index, :show, :new, :create, :edit, :update]
  #↓次回やる。CSRF対策を一時的にOFFにしているとのこと。
  skip_before_action :verify_authenticity_token, only:[:ajax_create]

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

  # def create
  #   @moku = Moku.new(
  #     user_id: current_user.id,
  #     moku_type_id: params[:moku_type],
  #     mjn_public: params[:mjn_public],
  #   )

  #   if @moku.save
  #     flash[:notice] = "MOKU開始！頑張って！"
  #     redirect_to(mypage_path)
  #   else
  #     render action: :new
  #   end
  # end

  def ajax_create
    moku = Moku.new
    moku.user_id = params[:user_id]
    moku.moku_type_id = params[:moku_type_id]
    moku.mjn_public = params[:mjn_public]
    moku.started_at = DateTime.now

    if moku.save!
      flash[:notice] = "MOKU開始！頑張って！"
      render json: moku
    else
      render :new
    end
  end

  def finish
    moku = Moku.find params[:id]
    moku.finished_at = DateTime.now
    moku.moku_time = params[:moku_time]

    moku.save!
    flash[:notice] = "おつかれさまでした！"
    redirect_to("/mypage")
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
    # @moku.mjn_public = params[:moku][:mjn_public] →開始時にしか拾わないからupdateでは必要ない

    moku_type = MokuType.find(params[:moku][:moku_type])
    @moku.moku_type = moku_type

    if @moku.save!
      flash[:notice] = "更新しました！"
    else
      render action: :edit
    end

    redirect_to action: :show, user_id: user.id, id: @moku.id
  end

  def justnow
    mokus = Moku.where(mjn_public: true).order(created_at: 'desc').limit(5) # 最新を先に表示するから、desc
    render json: mokus, include:[:user, :moku_type], methods: [:format_created_at]#これでmokusがjson(≒JSのハッシュ)になる。さらになぜかuserモデルとmoku_typeモデルが拾える。
  end
end