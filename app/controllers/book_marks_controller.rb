class BookMarksController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @book_marks = BookMark.where(user_id: params[:user_id])
  end

  def create
    @book_mark = BookMark.new(
      user_id: current_user.id,
      work_id: params[:work_id]
      )

      @book_mark.save!
      redirect_to user_work_path(current_user.id, params[:work_id])
  end

  def destroy
    @book_mark = BookMark.find_by(
      user_id: current_user.id,
      work_id: params[:work_id]
      )

    @book_mark.destroy
    redirect_to user_work_path(current_user.id, params[:work_id])
  end
end
