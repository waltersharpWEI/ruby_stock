$:.push('./gen-rb')
$:.push('../utils')
require 'thrift'
require 'remote_stock'
require 'dao_stock'

class RemoteStockHandler
  def initialize()
    @stock = Stock.new('../data/stock.json',0)
  end

  def sell_good(op)
    @stock.sellGood(op.name,op.number)
    @stock.saveStock()
    return 0
  end

  def buy_good(op)
    @stock.bullGood(op.name,op.number)
    @stock.saveStock()
    return 0
  end

end
handler = RemoteStockHandler.new()
processor = RemoteStock::Processor.new(handler)
transport = Thrift::ServerSocket.new(9090)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor,transport,transportFactory)
puts "Starting the Remote Stock server..."
server.serve()
puts "done."
puts 'load ok'
