class MypageController < ApplicationController

  before_action :sign_in_required

  def index
    @user = User.find_by(id: current_user.id)
    @works_random = Work.all.order("RANDOM()").limit(3)
    @faq = Faq.new
  end

  def show
    @user = User.find(params[:id])
    @works_random = Work.all.order("RANDOM()").limit(3)
  end

  def edit

  end
end
