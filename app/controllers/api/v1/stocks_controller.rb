class Api::V1::StocksController < Api::V1::BaseController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]

  def index
    @stocks = Stock.paginate(page: params[:page], per_page: 100)
  end

  def show
    render :show, status: :ok, location: @stock
  end

  def new
    @stock = Stock.new

    render :new, status: :ok, location: @stock
  end

  def create
    stock = Stock.new(stock_params)

    if stock.save
      render :show, status: :ok, location: stock
    else
      render json: stock.errors, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @stock.update(stock_params)
      render :show, status: :ok, location: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @stock.destroy
      render :show, status: :ok, location: exchange_stocks_path(exchange_id: @stock.exchange_id)
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

private

  def stock_params
    params.require(:stock).permit(:name, :location)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
