/** Structs are the basic complex data structures. They are comprised of fields 
   * which each have an integer identifier, a type, a symbolic name, and an 
   * optional default value. */

struct RemoteStockOperation {
	1:string name,
        2:i32 number,
}

/* Structs can also be exceptions, if they are nasty. */
exception RemoteStockException {
	1:string msg,
	2:optional double x,
}

service RemoteStock {
	i16 sell_good(1:RemoteStockOperation op) throws (1:RemoteStockException se),
        i16 buy_good(1:RemoteStockOperation op) throws (1:RemoteStockException se)
}
