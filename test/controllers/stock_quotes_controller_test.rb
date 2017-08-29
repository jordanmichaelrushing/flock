require 'test_helper'

class StockQuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    exchange = FactoryGirl.create(:exchange)
    @stock = FactoryGirl.create(:stock, exchange: exchange)
    @stock_quote = FactoryGirl.create(:stock_quote, stock: @stock)
  end

  before do
    sign_in(FactoryGirl.create(:user))
  end

  test "should get index" do
    get stock_quotes_url
    assert_response :success
  end

  test "should show stock_quote" do
    get stock_quote_url(@stock_quote)
    assert_response :success
  end
end
