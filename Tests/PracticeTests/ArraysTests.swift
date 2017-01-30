import XCTest
@testable import Practice

class ArraysTests : XCTestCase {
	var arrays: Arrays!
	var array = [1,2,4,4,5,6,6,7]

	override func setUp() {
		super.setUp()
		self.arrays = Arrays()
	}

	func testGetUnique(_ out: [Int])
	{
		XCTAssert(out.count == 6)
		XCTAssert(out[0] == 1)
		XCTAssert(out[1] == 2)
		XCTAssert(out[2] == 4)
		XCTAssert(out[3] == 5)
	}

	func test1() {
		var out = self.arrays.getUniqueFromArray2(array: array)
		self.testGetUnique(out)
	}

	func test2() {
		var out = self.arrays.getUniqueFromArray2(array: array)
		self.testGetUnique(out)
	}

	func test3() {
		var out = self.arrays.getUniqueFromArray3(array: array)
		self.testGetUnique(out)
	}
}