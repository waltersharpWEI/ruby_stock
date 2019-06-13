#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

def print_stock(path_to_json)
    json = File.read(path_to_json)
    obj = JSON.parse(json)
    pp obj
end

def sell_good(path_to_json,name,number)
    json = File.read(path_to_json)
    obj = JSON.parse(json)
end
