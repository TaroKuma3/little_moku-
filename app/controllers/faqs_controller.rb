class FaqsController < ApplicationController
  def index
    @faqs = Faq.all
  end

  def show
    @faq = Faq.find_by(id: params[:id])
  end
end
