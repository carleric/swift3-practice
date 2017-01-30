import XCTest
@testable import Practice

class ReducerTests : XCTestCase {
	var reducer: Reducer!


	override func setUp() {
		super.setUp()
		self.reducer = Reducer()
	}

	func test1() {
		var array = [1,2,4,4,5,6,6,7]
		XCTAssert(self.reducer.getUniqueFromArray(array: array).count == 6)
	}

	func test2() {
		var array = [1,2,4,4,5,6,6,7]
		var out = self.reducer.getUniqueFromArray(array: array)
		XCTAssert(out.count == 6)
		XCTAssert(out[0] == 1)
		XCTAssert(out[1] == 2)
		XCTAssert(out[2] == 4)
		XCTAssert(out[3] == 5)
	}
}