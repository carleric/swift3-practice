import Foundation

public enum DivisibleBy: String {
	case three, five, three_five
}

protocol Divisible {
	func isDivisible(_ by: Int) -> String?
	func testForRange(_:CountableClosedRange<Int>)
}

public class Divisors: Divisible {

	func isDivisible(_ by: Int) -> String? {
		if(by % 3 == 0 && by % 5 == 0) {
			return DivisibleBy.three_five.rawValue
		}
		else if(by % 3 == 0) {
			return DivisibleBy.three.rawValue
		}
		else if(by % 5 == 0) {
			return DivisibleBy.five.rawValue
		}
		else {
			return nil
		} 
	}

	func testForRange(_ range:CountableClosedRange<Int>) {
		for int in range {
			if let divisibleBy = self.isDivisible(int) {
				print("\(int) \(divisibleBy)")
			}
		}
	}
}