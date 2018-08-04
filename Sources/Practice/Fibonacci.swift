import Foundation

// Fib sequence is sum of previous two elements, starting at 0, 1
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34 ...
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
   
   //dynamic, recursive
   public func atNDynamic(_ n: Int) -> Int {
      
      if (n < 2) {
         return elements[n]
      }
      let n1 = fibMemo[n-1] ?? atNDynamic(n-1)
      let n2 = fibMemo[n-2] ?? atNDynamic(n-2)
      
      fibMemo[n] = n1 + n2
      return n1 + n2
   }

	//bottom up, iterative
	public func atNBetter(_ n: Int) -> Int {
      if n < 2 { return n }
		var a = 0
		var b = 1
		for _ in 2..<n {
			let c = a + b
			a = b
			b = c
		}
		return a + b
	}
   
}
