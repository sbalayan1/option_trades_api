class OptionTrade < ApplicationRecord
    validates :ticker, :buy_date, :sell_date, :strike, :option_type, :expiration_date, :quantity, :buy_price, :sell_price, presence: { message: "%{attribute} must be given", strict: true }
    validates :sell_date, :expiration_date, comparison: { greater_than_or_equal_to: :buy_date, message: "%{attribute} is less than buy_date", strict: true }

    after_initialize do |trade|
        trade.attributes.each do |key, value|    
            raise ActiveModel::StrictValidationFailed if key != "created_at" && key != "updated_at" && key != "id" && value.nil?
        end
        trade
    end

end
