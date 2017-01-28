import XCTest
@testable import Practice

class FibonacciTest : XCTestCase {
	var fibonacci: Fibonacci!

	override func setUp() {
		super.setUp()
		self.fibonacci = Fibonacci()
	}

	func testAtN() {
		XCTAssert(self.fibonacci.atN(0) == 0)
		XCTAssert(self.fibonacci.atN(1) == 1)
		XCTAssert(self.fibonacci.atN(2) == 1)
		XCTAssert(self.fibonacci.atN(3) == 2)
		XCTAssert(self.fibonacci.atN(4) == 3)
		XCTAssert(self.fibonacci.atN(5) == 5)
		XCTAssert(self.fibonacci.atN(6) == 8)
	}

	func testAtNBetter() {
		XCTAssert(self.fibonacci.atNBetter(0) == 0)
		XCTAssert(self.fibonacci.atNBetter(1) == 1)
		XCTAssert(self.fibonacci.atNBetter(2) == 1)
		XCTAssert(self.fibonacci.atNBetter(3) == 2)
		XCTAssert(self.fibonacci.atNBetter(4) == 3)
		XCTAssert(self.fibonacci.atNBetter(5) == 5)
		XCTAssert(self.fibonacci.atNBetter(6) == 8)
	}
}