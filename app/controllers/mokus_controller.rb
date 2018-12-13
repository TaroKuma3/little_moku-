class MokusController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
    @mokus = Moku.where(user_id: @user.id)
  end

  def show
    @user = User.find_by(id: current_user.id)
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    @works = Work.where(moku_id: @moku.id)
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: 4)

    @select_moku_type = @user.moku_types << @moku_type
    # ↑これ自体はできる。ただ、「とりあえずMOKUる」タグの所持者＝user_idがcurrent_userのIDに上書きされる。
    # これにより選択肢データーをselect_moku_typeに書き換えると、選択肢の中には一応出る。
    # ためしたら、user_idが書き変わるのでやっぱりだめだ。

  end

  def create
    @user = User.find_by(id: params[:user_id])
    
    moku = Moku.new(
      user_id: @user.id,
      moku_type_id: params[:moku_type],
    )

    moku.save!
    redirect_to("/users/#{@user.id}")
  end


  def edit
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    # @moku_type = MokuType.find_by(id: @moku.moku_type_id)
    # @works = Work.where(moku_id: @moku.id)
  end

  def update
    user = User.find_by(id: params[:user_id])
    moku = Moku.find(params[:id])
    moku.content = params[:moku][:content]

    moku_type = MokuType.find(params[:moku][:moku_type])
    moku.moku_type = moku_type

    moku.save!

    redirect_to action: :show, user_id: user.id, id: moku.id
  end

  


end