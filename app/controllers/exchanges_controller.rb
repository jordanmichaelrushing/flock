class ExchangesController < ApplicationController
  before_action :set_exchange, only: [:show, :edit, :update, :destroy]

  def index
    @exchanges = Exchange.paginate(page: params[:page], per_page: 50)
  end

  def show
    respond_to do |format|
      format.html { render 'show' }
      format.json { render :show, status: :ok, location: @exchange }
    end
  end

  def new
    @exchange = Exchange.new

    respond_to do |format|
      format.html { render 'new' }
      format.json { render :new, status: :ok, location: @exchange }
    end
  end

  def create
    @exchange = Exchange.new(exchange_params)

    respond_to do |format|
      if @exchange.save
        format.html { redirect_to @exchange, notice: 'Exchange was successfully created.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :new, alert: @exchange.errors }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.html { render 'edit' }
      format.json { render :edit, status: :ok, location: @exchange }
    end
  end

  def update
    respond_to do |format|
      if @exchange.update(exchange_params)
        format.html { redirect_to @exchange, notice: 'Exchange was successfully updated.' }
        format.json { render :show, status: :ok, location: @exchange }
      else
        format.html { render :edit, alert: @exchange.errors }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @exchange.destroy
        format.html { redirect_to exchanges_path, notice: 'Exchange was successfully destroyed.' }
        format.json { render :show, status: :ok, location: exchanges_path }
      else
        format.html { render :show, alert: @exchange.errors }
        format.json { render json: @exchange.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def exchange_params
    params.require(:exchange).permit(:name, :location)
  end

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end
end