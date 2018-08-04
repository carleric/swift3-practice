import XCTest
@testable import Practice

class FibonacciTest : XCTestCase {
	var fibonacci: Fibonacci!

	override func setUp() {
		super.setUp()
		self.fibonacci = Fibonacci()
	}

	func testAtN() {
		XCTAssertEqual(self.fibonacci.atN(0), 0)
      XCTAssertEqual(self.fibonacci.atN(1), 1)
      XCTAssertEqual(self.fibonacci.atN(2), 1)
      XCTAssertEqual(self.fibonacci.atN(3), 2)
      XCTAssertEqual(self.fibonacci.atN(4), 3)
      XCTAssertEqual(self.fibonacci.atN(5), 5)
      XCTAssertEqual(self.fibonacci.atN(6), 8)
	}

	func testAtNBetter() {
      XCTAssertEqual(self.fibonacci.atNBetter(0), 0)
      XCTAssertEqual(self.fibonacci.atNBetter(1), 1)
      XCTAssertEqual(self.fibonacci.atNBetter(2), 1)
      XCTAssertEqual(self.fibonacci.atNBetter(3), 2)
      XCTAssertEqual(self.fibonacci.atNBetter(4), 3)
      XCTAssertEqual(self.fibonacci.atNBetter(5), 5)
      XCTAssertEqual(self.fibonacci.atNBetter(6), 8)
	}
   
   func testAtNDynamic() {
      XCTAssertEqual(self.fibonacci.atNDynamic(0), 0)
      XCTAssertEqual(self.fibonacci.atNDynamic(1), 1)
      XCTAssertEqual(self.fibonacci.atNDynamic(2), 1)
      XCTAssertEqual(self.fibonacci.atNDynamic(3), 2)
      XCTAssertEqual(self.fibonacci.atNDynamic(4), 3)
      XCTAssertEqual(self.fibonacci.atNDynamic(5), 5)
      XCTAssertEqual(self.fibonacci.atNDynamic(6), 8)
   }
}
