class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]

  def index
    @user = User.find_by(id: current_user.id)
    @works_random = Work.all.order("RANDOM()").limit(3)
  end

  def show
    @user = User.find(params[:id])
    @works_random = Work.all.order("RANDOM()").limit(3)
  end
end
