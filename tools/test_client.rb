puts 'tester'
$:.push('../service/gen-rb')

require 'thrift'
require 'remote_stock'

begin
  	port = ARGV[0] || 9090

	transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost',9090))
	protocol = Thrift::BinaryProtocol.new(transport)
	client = RemoteStock::Client.new(protocol)

	transport.open()

	ar = RemoteStockOperation.new()    
	ar.name = "Apple"
	ar.number = 10
	
	# Run a remote calculation
        result = client.sell_good(ar) while TRUE #it accessing the ruby server program method calc via thrift service
	puts result.inspect
	
	transport.close()
rescue
  puts $!
end
