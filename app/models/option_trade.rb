class OptionTrade < ApplicationRecord
    @@attributes = [:ticker, :buy_date, :sell_date, :strike, :option_type, :expiration_date, :quantity, :buy_price, :sell_price]

    validates *@@attributes, presence: { message: "%{attribute} must be given", strict: true }
    validates :sell_date, :expiration_date, comparison: { greater_than_or_equal_to: :buy_date, message: "%{attribute} is less than buy_date", strict: true }
    validates :expiration_date, comparison: { greater_than_or_equal_to: :sell_date, message: "%{attribute} is less than sell_date", strict: true}

    #ensures that an exception is raised after an instance is instantiated with nil values.
    #this does not prevent initialization. 
    after_initialize do |trade|
        trade.attributes.each do |key, value|    
            raise ActiveModel::StrictValidationFailed if key != "created_at" && key != "updated_at" && key != "id" && value.nil?
        end
        trade
    end

    #create an attributes class method that outputs the attributes class variable
    def self.attributes
        @@attributes
    end
end
