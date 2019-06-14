#!/usr/bin/ruby

require_relative 'utils/dao_stock.rb'

stock1 = Stock.new('data/stock.json',0)

while true 
  for i in 1..100000000 
    stock1.buyGood('Apple', 15)
    stock1.buyGood('Orange', 8)
    stock1.sellGood('Apple', 6)
    stock1.saveStock()
  end
end


