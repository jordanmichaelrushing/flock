require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exchange = FactoryGirl.create(:exchange)
    @stock = FactoryGirl.create(:stock, exchange: @exchange)
  end

  before do
    sign_in(FactoryGirl.create(:user))
  end

  test "should get index" do
    get exchange_stocks_url(exchange_id: @exchange.id)
    assert_response :success
  end

  test "should get new" do
    get new_exchange_stock_url(exchange_id: @exchange.id)
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post stocks_url, params: { stock: { name: 'Merp', exchange_id: @exchange.id } }
    end

    assert_redirected_to exchange_stock_url(id: Stock.last.id, exchange_id: Stock.last.exchange_id)
  end

  test "should show stock" do
    get exchange_stock_url(id: @stock.id, exchange_id: @exchange.id)
    assert_response :success
  end

  test "should get edit" do
    get edit_exchange_stock_url(exchange_id: @exchange.id, id: @stock.id)
    assert_response :success
  end

  test "should update stock" do
    patch stock_url(@stock), params: { stock: { name: 'Derp', exchange_id: @exchange.id } }
    assert_redirected_to exchange_stock_url(id: @stock.id, exchange_id: @stock.exchange_id)
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete stock_url(@stock)
    end

    assert_redirected_to exchange_stocks_url(exchange_id: @exchange.id)
  end
end
