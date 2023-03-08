class OptionTrade < ApplicationRecord
    validates :ticker, presence: true
    validates :buy_date, presence: true
    validates :sell_date, presence: true, comparison: {greater_than_or_equal_to: :sell_date}
    validates :strike, presence: true
    validates :option_type, presence: true
    validates :expiration_date, presence: true
    validates :quantity, presence: true
    validates :buy_price, presence: true
    validates :sell_price, presence: true

    def initialize(ticker, buy_date, sell_date, strike, option_type, expiration_date, quantity, buy_price, sell_price)
        @ticker = ticker
        @buy_date = buy_date
        @sell_date = sell_date
        @strike = strike
        @option_type = option_type
        @expiration_date = expiration_date
        @quantity = quantity
        @buy_price = buy_price
        @sell_price = sell_price
    end

end
