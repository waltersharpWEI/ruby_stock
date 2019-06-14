#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'

class Stock
  def initialize(ptj, opc)
    @path_to_json, @op_count = ptj,opc
    json = File.read(@path_to_json)
    obj = JSON.parse(json)
    @json_handle = obj
  end

  def getPathToJson
    @path_to_json
  end

  def setPathToJson(ptj)
    @path_to_json = ptj
    json = File.read(@path_to_json)
    obj = JSON.parse(json)
    if obj == nil
      raise 'invalid path to json file' 
    else
      @json_handle = obj
    end
  end

  def getOpCount
    @op_count
  end

  def setOpCount(opc)
    @op_count = opc
  end

  def printStock
    pp @json_handle
  end

  def sellGood(name,number)
    for good in @json_handle['things']
      if good['name'] == name
        temp = Integer(good['number'])
        #puts temp
        if temp - number < 0
          return 1
        end
        temp -= number
        #puts temp
        good['number'] = temp.to_s
        break
      end
    end
    return 0
  end

  def buyGood(name,number)
    for good in @json_handle['things']
      if good['name'] == name
        temp = Integer(good['number'])
        temp += number
        good['number'] = temp.to_s
        break
      end
    end
    return 0
  end

  def saveStock 
    temp_str = @json_handle.to_json
    File.write(@path_to_json, temp_str)
  end

end
