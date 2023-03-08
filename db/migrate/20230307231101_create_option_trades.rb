class CreateOptionTrades < ActiveRecord::Migration[7.0]
  def change
    create_table :option_trades do |t|
      t.string :ticker 
      t.date :buy_date  
      t.date :sell_date 
      t.float :strike 
      t.string :option_type 
      t.date :expiration_date 
      t.integer :quantity 
      t.float :buy_price 
      t.float :sell_price 
  
      t.timestamps
    end
  end
end
