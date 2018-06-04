# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

arr = ["BTC", "ETH", "XRP", "EOS", "LTC", "XLM", "TRX", "NEO"]
arr.each do |elem|
    Holding.create(name: elem, holding_type: "CRYPTO")
end

CSV.foreach("/Users/joshuaseyda/Documents/wdi1/passion/investment/public/NYSE_20180530.csv") do |row|
    Holding.create(name: row[0], holding_type: "NYSE")
end

20.times do
    User.create(email: Faker::Internet.unique.email, password: "password", username: Faker::Internet.user_name)
end

100.times do
    @holding = Holding.all.sample  
    @rand1 = 1+rand(20)
    @rand2 = 1+rand(10000)
    @port = Portfolio.create(user_id: @rand1, holding_type: @holding.holding_type, holding_id: @holding.id, num_of_shares: @rand2)
end
 
# 50.times do
#  @holding = Holding.where("holding_type ='CRYPTO'")
#  @holding_sample = @holding.sample
#  @rand1 = 1+rand(20)
#     @rand2 = 1+rand(10000)
#     @port = Portfolio.create(user_id: @rand1, holding_type: @holding_sample.holding_type, holding_id: @holding_sample.id, num_of_shares: @rand2)
# end





