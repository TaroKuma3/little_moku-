class UsersController < ApplicationController
  # ↓application_controllerでprivateに書いた。ログインしてないならログイン画面に飛ばされるメソッド
  # 最初は, only: [:index]が書かれていたけどindexだけにしなくていいと思うので外す
  before_action :sign_in_required

  def index
    @user = User.find_by(id: current_user.id)
    @works_random = Work.all.order("RANDOM()").limit(3)
  end

  def show
    @user = User.find(params[:id])
    @works_random = Work.all.order("RANDOM()").limit(3)
  end
end
