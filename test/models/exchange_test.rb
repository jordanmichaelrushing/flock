require 'test_helper'

class ExchangeTest < ActiveSupport::TestCase
  test "should not save if not apart of approved exchanges" do
    refute(FactoryGirl.build(:exchange, name: "MERP").valid?)
  end

  test "uniqueness of names" do
    # User Exchange::VALID_NAMES in case the current defaults ever change
    FactoryGirl.create(:exchange, name: Exchange::VALID_NAMES.first)
    refute(FactoryGirl.build(:exchange, name: Exchange::VALID_NAMES.first).valid?)
  end
end
