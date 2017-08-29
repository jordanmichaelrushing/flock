class Api::V1::StockQuotesController < Api::V1::BaseController
  before_action :set_stock_quote, only: [:show, :edit, :update, :destroy]

  def index
    @stock_quotes = StockQuote.paginate(page: params[:page], per_page: 100)
  end

  def show
    render :show, status: :ok, location: @stock_quote
  end

  def new
    @stock_quote = StockQuote.new

    render :new, status: :ok, location: @stock_quote
  end

  def create
    stock_quote = StockQuote.new(stock_quote_params)

    if stock_quote.save
      render :show, status: :ok, location: stock_quote
    else
      render json: stock_quote.errors, status: :unprocessable_entity
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