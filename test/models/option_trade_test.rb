require "test_helper"
require 'faker'
require_relative '../../helper_functions'

puts('clearing database')
OptionTrade.destroy_all()


class OptionTradeTest < ActiveSupport::TestCase
  stock = Faker::Finance.ticker

  test 'test database should not be empty' do
    # OptionTrade.new(
    #   ticker: stock, 
    #   buy_date: create_date(3,3,2023), 
    #   sell_date: create_date(3,3,2023), 
    #   strike: 100, 
    #   option_type:"CALLS", 
    #   expiration_date: create_date(3,10,2023),
    #   quantity: 1,
    #   buy_price: 100,
    #   sell_price: 100
    # ) 
    assert_not_empty OptionTrade.all(), "Database is empty"
  end

  # test 'OptionTrades throws ArgumentError when initialized with no arguments or missing arguments' do
  #   # assert_not OptionTrade.new
  #   assert_raises(ArgumentError, "This should raise an ArgumentError") do
  #     OptionTrade.new
  #   end

  #   assert_raises(ArgumentError, "This should raise an ArgumentError") do
  #     OptionTrade.new(
  #       ticker: stock, 
  #       buy_date: create_date(3,3,2023), 
  #       sell_date: create_date(3,3,2023), 
  #       strike: 100, 
  #       option_type:"CALLS", 
  #       expiration_date: create_date(3,10,2023),
  #       quantity: 1,
  #       buy_price: 100,
  #     )
  #   end
  # end

  # test 'Create/New methods do not throw an errors' do
  #   trade = OptionTrade.new(
  #     ticker: stock, 
  #     buy_date: create_date(3,3,2023), 
  #     sell_date: create_date(3,3,2023), 
  #     strike: 100, 
  #     option_type:"CALLS", 
  #     expiration_date: create_date(3,10,2023),
  #     quantity: 1,
  #     buy_price: 100,
  #     sell_price: 100
  #   )
  

  #   assert_instance_of(OptionTrade, trade, msg="The new instance is not an instance of the ObjectTrade class")
  # end



  # test "should not save option trade with missing values" do
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
