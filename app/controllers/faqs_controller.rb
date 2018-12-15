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
    faq = Faq.new(
      questions: params[:faq][:questions],
      answer: params[:faq][:answer],
      category: params[:faq][:category],
    )

    faq.save!
    redirect_to(faqs_index_path)
  end

  def destroy
    faq = Faq.find(:id)
    faq.destroy
    redirect_to(faqs_index_path)
  end
end
