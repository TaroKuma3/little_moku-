class MokusController < ApplicationController
  def index

    # 絞り込み用を書く
    if params[:moku_type]
      @user = User.find_by(id: current_user.id)
      # @moku_type = MokuType.where(id: params[:id])
      @mokus = Moku.where(user_id: current_user.id).where(moku_type_id: params[:moku_type])
    else
      @user = User.find_by(id: current_user.id)
      @mokus = Moku.where(user_id: @user.id)
    end
  end

  def show
    @user = User.find_by(id: current_user.id)
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    @works = Work.where(moku_id: @moku.id)
  end

  def new
    @user = current_user
    @moku = Moku.find_by(id: params[:id])
  end
# ★mokuをnewするのに一体なんのidを拾ってる？これnewmにするとmoku_typeが拾えなくなってエラー出る
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
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    # @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    # @works = Work.where(moku_id: @moku.id)
  end

  def update
    user = User.find_by(id: params[:user_id])
    @moku = Moku.find(params[:id])
    @moku.content = params[:moku][:content]

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