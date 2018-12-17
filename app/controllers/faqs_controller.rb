class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find_by(id: params[:id])
  end

  def new
    @faq = Faq.new
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
    redirect_to(faqs_index_path)
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
    redirect_to(faqs_index_path)
  end


  def destroy
    @faq = Faq.find_by(id: params[:id])
    @faq.destroy
    redirect_to(faqs_index_path)
  end
end
