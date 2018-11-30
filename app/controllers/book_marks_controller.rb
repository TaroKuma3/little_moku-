class BookMarksController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @book_marks = BookMark.where(user_id: params[:user_id])
  end
end