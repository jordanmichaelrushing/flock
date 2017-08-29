class StockQuotesController < ApplicationController
  before_action :set_stock_quote, only: [:show, :update, :destroy]

  def index
    @stock_quotes = StockQuote.paginate(page: params[:page], per_page: 100)
  end

  def show
    respond_to do |format|
      format.html { render 'show' }
      format.json { render :show, status: :ok, location: @stock_quote }
    end
  end

private

  def stock_quote_params
    params.require(:stock_quote).permit(:amount, :stock_id)
  end

  def set_stock_quote
    @stock_quote = StockQuote.find(params[:id])
  end
end