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
		let out = self.arrays.getUniqueFromArray(array: array)
		self.testGetUnique(out)
	}

	func test2() {
		let out = self.arrays.getUniqueFromArray2(array: array)
		self.testGetUnique(out)
	}

	func test3() {
		let out = self.arrays.getUniqueFromArray3(array: array)
		self.testGetUnique(out)
	}

	func testMatrix1(matrix: [[Int]]) {
		XCTAssert(matrix[0][0] == 0)
		XCTAssert(matrix[0][1] == 0)
		XCTAssert(matrix[0][2] == 0)
		XCTAssert(matrix[0][3] == 0)
		XCTAssert(matrix[1][3] == 0)
		XCTAssert(matrix[2][3] == 0)
		XCTAssert(matrix[1][2] == 6)
	}

	func testZeroOut1() {
		var matrix = [[1, 2, 3, 0], [4, 5, 6, 9], [3, 5, 6, 2]]
		self.arrays.zeroOut1(matrix: &matrix)
		self.testMatrix1(matrix: matrix)
	}

	func testZeroOut2() {
		var matrix = [[1, 2, 3, 0], [4, 5, 6, 9], [3, 5, 6, 2]]
		self.arrays.zeroOut2(matrix: &matrix)
		self.testMatrix1(matrix: matrix)
	}

	// func testZeroOut3() {
	// 	var matrix = [[1, 2, 3, 0], [4, 0, 6, 9], [3, 5, 6, 2]]
	// 	self.arrays.zeroOut3(matrix: &matrix)
	// 	XCTAssert(matrix[0][0] == 0)
	// 	XCTAssert(matrix[0][1] == 2)
	// 	XCTAssert(matrix[0][2] == 0)
	// 	XCTAssert(matrix[0][3] == 0)
	// 	XCTAssert(matrix[1][3] == 0)
	// 	XCTAssert(matrix[2][3] == 0)
	// 	XCTAssert(matrix[1][2] == 0)
	// }

	func testZeroOut4() {
		var matrix = [[1, 2, 3, 0], [4, 5, 6, 9], [3, 5, 6, 2]]
		self.arrays.zeroOut4(matrix: &matrix)
		self.testMatrix1(matrix: matrix)
	}

	func testWalkMatrixClockwise() {
		var matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
		let outArray = self.arrays.walkMatrixClockwise(&matrix)
		XCTAssert(outArray == [1, 2, 3, 4, 5, 6, 7, 8, 9])
	}
}
