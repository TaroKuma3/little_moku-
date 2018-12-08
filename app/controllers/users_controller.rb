class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @works_random = Work.all.order("RANDOM()").limit(3)
  end
end
