class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  def index
    @quotes = Quote.all
  end

  def new
    @quote = Quote.new
  end

  def show
  end

  def edit
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save!
      flash[:notice] = "Quote added :)"
      redirect_to @quote
    else
      render :new
    end
  end

  def update
    if @quote.update(quote_params)
      flash[:notice] = "Quote updated :)"
      redirect_to :quote
    else
      render :new
    end
  end

  def destroy
    if @quote.destroy
      flash[:notice] = "Quote destroyed!"
      redirect_to quotes_path
    else
      redirect_to quotes_path, error: 'Quote was NOT destroyed.'
    end
  end

  private
  def set_quote
    @quote = Quote.find(patams[:id])
  end

  private
  def quote_params
      params.require(:quote).permit(:content, :source, :author_id)
  end
end
