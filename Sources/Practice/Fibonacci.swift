
public class Fibonacci {
	
	var elements = [0, 1]

	public func atN(_ n: Int) -> Int {

		if(n < 2) {
			return elements[n]
		}

		return atN(n - 1) + atN(n - 2)

	}

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
}