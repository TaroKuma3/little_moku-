class FaqsController < ApplicationController

  before_action :ensure_admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def new
    @faq = Faq.new
    # @faqs = Faq.all
    @user = User.find_by(id: current_user.id)

    # ↓これアクティブにすると、カテゴリ新規追加に反映されてselecteddに反映しなくなっちゃう
    # @faq.category = Constants::GENERAL
  end

  def create
    # user = User.find_by(id: current_user.id)

    @faq = Faq.new(faq_params)
      # questions: params[:faq][:questions],
      # answer: params[:faq][:answer],
      # category: params[:faq][:category],
      @faq.user_id = current_user.id

    if @faq.save
      flash[:notice] = "FAQを登録しました！"
      redirect_to(faqs_path)
    else
      render(faqs_new_path)
    end
  end

  def edit
    @faq = Faq.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def update
    @faq = Faq.find(params[:id])
    @faq.update(faq_params)
    # @faq.questions = params[:faq][:questions]
    # @faq.answer = params[:faq][:answer]
    # @faq.category = params[:faq][:category]
    # user_id = current_user.id

    if @faq.save
      flash[:notice] = "FAQを更新しました！"
      redirect_to("/faqs/#{@faq.id}")
    else
      render action: :edit
    end
  end


  def destroy
    @faq = Faq.find_by(id: params[:id])
    @faq.destroy
    redirect_to(faqs_path)
  end

  private
  def ensure_admin_user
    user = User.find_by(id: current_user.id)

    if user.admin == false
      flash[:notice] = "権限がありません"
      redirect_to(mypage_path)
    end

  end

  def faq_params
    params.require(:faq).permit(:id, :questions, :answer, :category_list) #, :user_id)
  end
end
