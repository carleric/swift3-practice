import Foundation

public class Fibonacci {
	
	var elements = [0, 1]
   var fibMemo: [Int: Int] = [Int: Int]()

	//recursive
	public func atN(_ n: Int) -> Int {

		if(n < 2) {
			return elements[n]
		}

		return atN(n - 1) + atN(n - 2)
	}

	//bottom up
	public func atNBetter(_ n: Int) -> Int {
		if(n < 2) {
			return elements[n]
		}
		var fib = 0
		var fibMinus2 = 0
		var fibMinus1 = 1
		for _ in 2...n {
			fib = fibMinus2 + fibMinus1

			fibMinus2 = fibMinus1
			fibMinus1 = fib 
		}
		return fib
	}
   
   //dynamic
   public func fibDynamic(_ n: Int) -> Int {
      
      if (n < 2) {
         return elements[n]
      }
      let n1 = fibMemo[n-1] ?? fibDynamic(n-1)
      let n2 = fibMemo[n-2] ?? fibDynamic(n-2)
      
      fibMemo[n] = n1 + n2
      return n1 + n2
   }
}
