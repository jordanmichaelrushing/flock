class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]
  before_action :set_exchange, only: [:index, :new, :show, :edit]

  def index
    @stocks = Stock.paginate(page: params[:page], per_page: 100)
  end

  def show
    respond_to do |format|
      format.html { render 'show' }
      format.json { render :show, status: :ok, location: @stock }
    end
  end

  def new
    @stock = Stock.new
    @exchange = Exchange.find(params[:exchange_id])

    respond_to do |format|
      format.html { render 'new' }
      format.json { render :new, status: :ok, location: @stock }
    end
  end

  def create
    @stock = Stock.new(stock_params)

    respond_to do |format|
      if @stock.save
        format.html { redirect_to exchange_stock_url(id: @stock.id, exchange_id: @stock.exchange_id),
                      notice: 'Stock was successfully created.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :new, alert: @stock.errors }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render 'edit' }
      format.json { render :edit, status: :ok, location: @stock }
    end
  end

  def update
    respond_to do |format|
      if @stock.update(stock_params)
        format.html { redirect_to exchange_stock_url(id: @stock.id, exchange_id: @stock.exchange_id),
                      notice: 'Stock was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock }
      else
        format.html { render :edit, alert: @stock.errors }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @stock.destroy
        format.html { redirect_to exchange_stocks_path(exchange_id: @stock.exchange_id),
                      notice: 'Stock was successfully destroyed.' }
        format.json { render :show, status: :ok, location: exchange_stocks_path(exchange_id: @stock.exchange_id) }
      else
        format.html { render :show, alert: @stock.errors }
        format.json { render json: @stock.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def stock_params
    params.require(:stock).permit(:name, :location, :exchange_id)
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def set_exchange
    @exchange = Exchange.find(params[:exchange_id])
  end
end