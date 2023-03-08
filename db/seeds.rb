require_relative "../helper_functions"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# t.string :ticker, :null => false
# t.date :buy_date, :null => false 
# t.date :sell_date, :null => false
# t.float :strike, :null => false
# t.string :type, :null => false
# t.integer :time_to_expiration, :null => false
# t.integer :quantity, :null => false
# t.float :buy_price, :null => false
# t.float :sell_price, :null => false

puts "Clearing database"
OptionTrade.destroy_all()

puts 'Seeding database!!!!'



OptionTrade.create(ticker: 'AAPL', buy_date: create_date(3, 7, 2023), sell_date: create_date(3, 8, 2023), strike: 150, option_type: 'PUTS', expiration_date: create_date(3, 10, 2023), 
quantity: 1, buy_price: 96, sell_price: 120)

puts "Done seeding!"