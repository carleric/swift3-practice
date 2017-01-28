import XCTest
@testable import Practice

class DivisorsTest : XCTestCase {
	var divisors: Divisors!

	override func setUp() {
		super.setUp()
		self.divisors = Divisors()
	}

	func testDivisibleByThree() {
		XCTAssert(self.divisors.isDivisible(21) == "three")
		XCTAssert(self.divisors.isDivisible(9) == "three")
		XCTAssert(self.divisors.isDivisible(33) == "three")
		XCTAssert(self.divisors.isDivisible(6) == "three")
		XCTAssertFalse(self.divisors.isDivisible(10) == "three")
	}

	func testDivisibleByFive() {
		XCTAssert(self.divisors.isDivisible(10) == "five")
	}

	func testDivisibleByThreeAndFive() {
		XCTAssert(self.divisors.isDivisible(15) == "three_five")
	}

	func testTestRange() {
		self.divisors.testForRange(0...10)
	}
}