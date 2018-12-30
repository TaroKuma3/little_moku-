class WorkController < MokusController
  def index
    @user = User.find_by(id: params[:user_id])
    @works = Work.where(user_id: params[:user_id])
  end

  def show
    @work = Work.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id]) #ここでひろうuser_idはURLに含まれるuser_id
    @moku = Moku.find_by(id: @work.moku_id)
    @bm_count = BookMark.where(work_id: @work.id).count
  end

  def new
    @user = User.find_by(id: current_user.id)
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type)
    @work = Work.new

    @work.public = Constants::PRIVATE
    @work.pick_up = Constants::PRIVATE
    # @public_or_not = [['公開', Constants::PUBLIC], ['非公開', Constants::PRIVATE]]
    # @public_or_not = Constants.options_for_public

  end

  # バリデートしたらrender時に一部のパラメータ拾わなくなったので一旦ストロングパラメータは＃
  def create
    @user = User.find_by(id: current_user.id)
    @moku = Moku.find_by(id: params[:id])
    # @moku_type = MokuType.find_by(id: @moku.moku_type)

    # ストロングパラメータを書いたからって手書きでデーター拾っちゃいけないわけじゃない。
    # 今回どういうわけかどうしてもmoku_idとuser_idをひろってくれないので、
    # ↓のようにwork.mokuとwork.userを手書きで指定して拾ってきた。
    @work = Work.new(#work_params)
    title: params[:work][:title],
    comment: params[:work][:comment],
    public: params[:work][:public],
    pick_up: params[:work][:pick_up],
    moku_id: params[:moku_id],
    user_id: params[:user_id],
    images: params[:work][:images],
    )
    @work.moku = Moku.find(params[:moku_id])
    @work.user = current_user

    if @work.save
      flash[:notice] = "登録しました！"
      redirect_to(user_work_index_path(@user))
    else
      render "new"
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def update
    @user = User.find_by(id: current_user.id)
    @work = Work.find_by(id: params[:id])
    @work.update(work_params)

    # image_ids→１つの記事に複数画像貼れるからids。
    # [:work][:image_ids]に削除対象のidが全部入ってる。
    params[:work][:image_ids].each do |image_id|
      image = @work.images.find(image_id)
      image.purge
    end

    if @work.save
      flash[:notice] = "更新しました！"
      redirect_to(user_work_path(@user,@work))
    else
      render action: :edit
    end
  end

  # findはactive storageのattachmentクラスが持ってるメソッド。
  # active strageだから使えるメソッドってこと。
  def delete_image #動詞を頭に持ってきた方がいいよ
    work = Work.find(params[:id])
    image = work.images.find params[:image_id]
    image.purge

    redirect_to("/users/#{current_user.id}/work/#{work.id}")

  end

  private
  # workのストロングパラメータ
  # バリデートしたらrender時に一部のパラメータ拾わなくなったので一旦＃で様子見る
  # def work_params
  #   params.require(:work).permit(:comment, :title, :images, :user_id, :moku_id, :public, :pick_up)
  # end
# permitに書くこと・・・create/updateに入れるべき属性名。意図しない項目が変に更新されないようにするためのものだけど
# paramsでとってくる項目で受け取りたいものをリストアプする。routesで設定しているURLに必要なIDとかは拾う必要がある
# ので、単に入力フォームのことだけを指定するんではなくて、user_idなんかも指定する。
end
