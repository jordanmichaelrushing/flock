require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test "should not save if exchange_id is missing" do
    refute(FactoryGirl.build(:stock, name: "MERP").valid?)
  end
end
