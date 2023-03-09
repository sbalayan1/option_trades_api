require "test_helper"
require 'faker'
require 'pry'

class OptionTradeTest < ActiveSupport::TestCase
  args = {
    ticker: 'AAPL',
    buy_date: create_date(3,8,2023),
    sell_date: create_date(3,8,2023),
    expiration_date: create_date(3,8,2023),
    buy_price: 100,
    sell_price: 100,
    option_type: 'CALLS',
    strike: 150,
    quantity: 1
  }

  stock = Faker::Finance.ticker

  test 'class cannot be initialized without arguments and raises StrictValidationFailed exception when initialized with missing or no arguments' do
    assert_raises(ActiveModel::StrictValidationFailed, "does not raise exception when instantiating with .new()") {
      OptionTrade.new()
    }
    
    assert_raises(ActiveModel::StrictValidationFailed, "does not raise exception when instantiating with .create()") {
      OptionTrade.create()
    }
  end

  test 'new instance of OptionTrade class' do
    good_trade = option_trades(:one)
    assert_instance_of OptionTrade, good_trade, "The good instance is not an instance of the ObjectTrade class"
  end

  test "class cannot be initialized with a sell_date or expiration_date that is less than the buy date and raises StrictValidationFailed exception" do
    assert_raises(ActiveModel::StrictValidationFailed, "\ndoes not raise a exception. sell dates are less than the buy_date") {
      args[:sell_date] = create_date(3,1,2023)
      OptionTrade.create(**args)
    }

    assert_raises(ActiveModel::StrictValidationFailed, "\ndoes not raise exception. expiration dates are less than the buy_date") {
      args[:expiration_date] = create_date(3,1,2023)
      OptionTrade.create(**args)
    }
    
  end

  test "class cannot be initialized with an expiration_date that is less than the sell_date and raises StrictValidationFailed exception" do
    assert_raises(ActiveModel::StrictValidationFailed, "\ndoes not raise exception. expiration date is less than sell date") {

      #user buys an option that expires on the same day. They should not be able to sell it any later
      args[:buy_date] = create_date(2,10,2023)
      args[:sell_date] = create_date(3,1,2023)
      args[:expiration_date] = create_date(2,10,2023)

      OptionTrade.create!(**args)
    }
  end

end


