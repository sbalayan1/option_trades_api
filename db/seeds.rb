require_relative "../helper_functions"
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Clearing database"
OptionTrade.destroy_all()

puts 'Seeding database!!!!'

# create an array of dates that are weekdays
dates = []
20.times do
    date = Faker::Date.between(from: 1.month.ago, to: Date.today) #generate a random date
    day_in_week = date.wday() #grab the dates day of the week
    dates.push(date) if day_in_week != 0 && day_in_week != 6 #add to the dates array if its not a Sunday or Saturday
end

#sort dates. dates need to be unique
dates = dates.uniq.sort

20.times do
    types = ["CALLS", "PUTS"]
    buy_date_idx = Random.new.rand(0..dates.length-1)

    args = {
        ticker: Faker::Finance.ticker,
        buy_date: dates[buy_date_idx], #access the dates array and select a random date
        strike: Faker::Number.between(from: 1, to: 1000),
        option_type: types[Random.new.rand(0..1)],
        quantity: Faker::Number.between(from: 1, to: 10),
        buy_price: Faker::Number.between(from: 20, to: 800),
        sell_price: Faker::Number.between(from: 20, to: 10000)
    }

    sell_date_idx = Random.new.rand(buy_date_idx..dates.length-1)
    args[:sell_date] = dates[sell_date_idx]

    exp_date_idx = Random.new.rand(sell_date_idx..dates.length-1)
    args[:expiration_date] = dates[exp_date_idx]
    OptionTrade.create(**args)
end

puts "Done seeding!"