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
    assert_raises(ActiveModel::StrictValidationFailed, "does not raise a StrictValidationFailed exception when instantiating with .new()") {
      OptionTrade.new()
    }

    
    assert_raises(ActiveModel::StrictValidationFailed, "does not raise a StrictValidationFailed exception when instantiating with .create()") {
      OptionTrade.create()
    }
  end

  test 'Initialization with the correct arguments and types creates an instance of the OptionTrade class' do
    good_trade = option_trades(:one)
    assert_instance_of OptionTrade, good_trade, "The good instance is not an instance of the ObjectTrade class"
  end

  test "class cannot be initialized with a sell_date or expiration_date that is less than the buy date and raises StrictValidationFailed exception" do
    assert_raises(ActiveModel::StrictValidationFailed, "does not raise a StrictValidationFailed exception when instantiated with .create() and sell dates that are less than the buy_date") {
      args[:sell_date] = create_date(3,1,2023)
      OptionTrade.create(**args)
    }

    assert_raises(ActiveModel::StrictValidationFailed, "does not raise a StrictValidationFailed exception when instantiated with .create() and expiration dates that are less than the buy_date") {
      args[:expiration_date] = create_date(3,1,2023)
      OptionTrade.create(**args)
    }
    
  end



  # test "initializing an option trade with missing arguments should thrown error" do
  #   option_trade = OptionTrade.new(
  #     ticker: stock, 
  #     buy_date: create_date(3,3,2023), 
  #     sell_date: create_date(3,3,2023), 
  #     strike: 100, 
  #     option_type:"CALLS", 
  #     expiration_date: create_date(3,10,2023),
  #     quantity: 1,
  #     buy_price: 100)
    
  #   errors = option_trade.errors
  #   puts errors
  #   assert_not option_trade.save, "Saved option with missing value"
  # end

  # test "able to save option trade with appropriate data" do
  # end


  # test "buy date should be less than or equal to sell date" do

  # end

  # test "expiration_date should be greater than or equal to buy_date" do
  # end

end


