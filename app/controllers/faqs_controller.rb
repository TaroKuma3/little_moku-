class FaqsController < ApplicationController

  before_action :ensure_admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find_by(id: params[:id])
  end

  def new
    @faq = Faq.new
    # @faqs = Faq.all
    @user = User.find_by(id: current_user.id)

    # ↓これアクティブにすると、カテゴリ新規追加に反映されてselecteddに反映しなくなっちゃう
    # @faq.category = Constants::GENERAL
  end

  def create
    user = User.find_by(id: current_user.id)

    faq = Faq.new(
      questions: params[:faq][:questions],
      answer: params[:faq][:answer],
      category: params[:faq][:category],
      user_id: user.id,
    )

    faq.save!
    redirect_to(faqs_path)
  end

  def edit
    @faq = Faq.find_by(id: params[:id])
    @user = User.find_by(id: current_user.id)
  end

  def update
    faq = Faq.find_by(id: params[:id])
    faq.questions = params[:faq][:questions]
    faq.answer = params[:faq][:answer]
    faq.category = params[:faq][:category]
    user_id = current_user.id

    faq.save!
    redirect_to(faqs_path)
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

end
