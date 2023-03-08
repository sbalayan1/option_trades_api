require "test_helper"
require 'faker'
require 'pry'

class OptionTradeTest < ActiveSupport::TestCase
  # include ActiveModel::Validations

  stock = Faker::Finance.ticker
  test 'class ensures instances are initialized WITH arguemnts BEFORE validations' do
  end


  test 'class cannot be initialized without arguments and raises StrictValidationFailed exception when initialized with missing or no arguments' do
    # invalid_trade = OptionTrade.new
    # assert invalid_trade.valid? == ActiveModel::StrictValidationFailed, "class does not invalidate initialization with missing or no arguments"
    
    assert_raises(ActiveModel::StrictValidationFailed, "class does not raise a StrictValidationFailed exception") {
      OptionTrade.create()
    }
  end

  test 'Initialization with the correct arguments and types creates an isntance of the OptionTrade class' do
    good_trade = option_trades(:one)
    assert_instance_of OptionTrade, good_trade, "The good instance is not an instance of the ObjectTrade class"
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


