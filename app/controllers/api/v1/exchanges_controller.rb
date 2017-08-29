class Api::V1::ExchangesController < Api::V1::BaseController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]

  def index
    @exchanges = Exchange.paginate(page: params[:page], per_page: 100)
  end

  def show
    render :show, status: :ok, location: @exchange
  end

  def new
    @exchange = Exchange.new

    render :new, status: :ok, location: @exchange
  end

  def create
    exchange = Exchange.new(exchange_params)

    if exchange.save
      render :show, status: :ok, location: exchange
    else
      render json: exchange.errors, status: :unprocessable_entity
    end
  end

  def edit
    render :edit, status: :ok, location: @exchange
    end
  end

  def update
    if @exchange.update(exchange_params)
      render :show, status: :ok, location: @exchange
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @exchange.destroy
      render :show, status: :ok, location: '/'
    else
      render json: @exchange.errors, status: :unprocessable_entity
    end
  end

private

  def exchange_params
    params.require(:exchange).permit(:name, :location, :active)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end