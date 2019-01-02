class AccountsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.name = params[:user][:name]
    @user.items = params[:user][:items]
    @user.introduce = params[:user][:introduce]
    @user.public = params[:user][:public]

    if @user.save
      flash[:notice] = "更新しました！"
      redirect_to ("/mypage")
    else
      render action: :edit
    end
  end

end
