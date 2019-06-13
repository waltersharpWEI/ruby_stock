#!/usr/bin/ruby

require_relative 'utils/dao_stock.rb'

stock1 = Stock.new('data/stock.json',0)
stock1.printStock()
stock1.sellGood('Apple', 1)
stock1.printStock()
puts stock1.getPathToJson() 
stock1.setPathToJson('data/stock1.json')
puts stock1.getPathToJson()
stock1.printStock()
stock1.setOpCount(2)
puts stock1.getOpCount()
stock1.saveStock()


