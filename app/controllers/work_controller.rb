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
  end

end
