class AnnouncementsController < ApplicationController
  def index
    @annoucement = Announcement.all
  end

  def show
  end

  def new
  end

  def create
    @announce = Aannoucement.new(announcement_params)
      @announce.user_id = current_user.id

    if @faq.save
      flash[:notice] = "お知らせを登録しました"
      redirect_to(nnouncements_index_path)
    else
      render(fnnouncements_index_new_path)
    end
  end

  def edit
  end

  def delete
  end

  private
  def annoucement_params
    params.require(:annoucement).permit(:id, :title, :body)
  end

end
