class MypageController < ApplicationController

  before_action :sign_in_required

  def index
    @user = User.find_by(id: current_user.id)
    @mypage_config = MypageConfig.find_by(user_id: current_user.id)
    @works_random = Work.where(pick_up: true).order("RANDOM()").limit(3)
    # @faq = Faq.new
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @mypage_config = MypageConfig.find_by(user_id: @user.id)
  end

  def edit
    @mypage_config = MypageConfig.find_by(user_id: current_user.id)
    @user = User.find_by(id: current_user.id)

  end

  def update
    @user = User.find_by(id: current_user.id)
    @mypage_config = MypageConfig.find_by(user_id: current_user.id)
    @mypage_config.update(mypage_config_params)

    if @mypage_config.save
      flash[:notice] = "更新しました！"
      redirect_to ("/mypage")
    else
      render action: :edit
    end
  end

  private
  def mypage_config_params
    params.require(:mypage_config).permit(:items, :introduce, :public, :user_id)
  end
end
