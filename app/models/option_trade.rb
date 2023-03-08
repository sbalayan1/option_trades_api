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
end
