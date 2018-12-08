class WorkController < MokusController
  def index
    @user = User.find_by(id: params[:user_id])
    @works = Work.where(user_id: params[:user_id])
  end

  def show
    @work = Work.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: @work.moku_id)
  end

  def edit
    @work = Work.find_by(id: params[:id])
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @moku = Moku.find_by(id: params[:id])
    @moku_type = MokuType.find_by(id: @moku.moku_type)
    @work = Work.new
    @work.public = Constants::PRIVATE
    @work.pick_up = Constants::PRIVATE
    # @public_or_not = [['公開', Constants::PUBLIC], ['非公開', Constants::PRIVATE]]
    # @public_or_not = Constants.options_for_public

  end

  def create
    @user = User.find_by(id: params[:user_id])

    work = Work.new(
    title: params[:work][:title],
    comment: params[:work][:comment],
    public: params[:work][:public],
    pick_up: params[:work][:pick_up],
    moku_id: params[:id],
    user_id: params[:user_id],
    )

    work.save
    redirect_to(user_work_index_path(@user))
  end

end
