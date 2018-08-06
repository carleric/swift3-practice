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
   
   func testWalkMatrixClockwise2() {
      let matrix = [[1, 2, 3], [8, 9, 4], [7, 6, 5]]
      let outArray = self.arrays.walkMatrixClockwise2(matrix)
      XCTAssert(outArray == [1, 2, 3, 4, 5, 6, 7, 8, 9])
   }
   
   func testRemoveDuplicates() {
      var in1 = [1, 1, 2, 3, 3, 4, 5, 5]
      let in1result = self.arrays.removeDuplicates(&in1)
      XCTAssertEqual(in1result, 5)
      XCTAssertEqual(in1[0], 1)
      XCTAssertEqual(in1[1], 2)
   }
   
   func testMaxProfit() {
      let in1 = [7,1,5,3,6,4]
      XCTAssertEqual(self.arrays.maxProfit(in1), 7)
      
      let in2 =  [1,2,3,4,5]
      XCTAssertEqual(self.arrays.maxProfit(in2), 4)
      
      let in3 = [7,6,4,3,1]
      XCTAssertEqual(self.arrays.maxProfit(in3), 0)
      
      let in4 = [7,1,5,6,3,1,2,5]
      XCTAssertEqual(self.arrays.maxProfit(in4), 9)
   }
   
   func testRotate() {
      var in1 = [1, 2]
      self.arrays.rotate(&in1, 1)
      XCTAssertEqual(in1, [2, 1])
   }
   
   func testSingleNumber() {
      let in1 = [2,2,1]
      XCTAssertEqual(self.arrays.singleNumber(in1), 1)
      
      let in2 = [4,1,2,1,2]
      XCTAssertEqual(self.arrays.singleNumber(in2), 4)
      
   }
   
   func testContainsDuplicate() {
      let in1 = [1,2,3,1]
      XCTAssert(self.arrays.containsDuplicate(in1))
      
      let in2 = [1,2,3]
      XCTAssertFalse(self.arrays.containsDuplicate(in2))
   }
   
   func testIntersect() {
      let in1 = [1, 2, 2, 1]
      let in2 = [2, 2]
      XCTAssertEqual(self.arrays.intersect2(in1, in2), [2, 2])
      
      let in3 = [1, 2, 2, 1, 4, 6, 1, 4]
      let in4 = [2, 2, 1, 4, 7]
      XCTAssertEqual(self.arrays.intersect2(in3, in4), [1, 2, 2, 4])
   }
   
   func testPlusOne() {
      XCTAssertEqual(self.arrays.plusOne([1, 2, 3]), [1, 2, 4])
      XCTAssertEqual(self.arrays.plusOne([1, 2, 9]), [1, 3, 0])
      XCTAssertEqual(self.arrays.plusOne([9,8,7,6,5,4,3,2,1,0]), [9,8,7,6,5,4,3,2,1,1])
      XCTAssertEqual(self.arrays.plusOne([9]), [1, 0])
   }
   
   func testMoveZeros() {
      var in1 = [1, 0, 2, 0, 3]
      self.arrays.moveZeroes2(&in1)
      XCTAssertEqual(in1, [1, 2, 3, 0, 0])
   }
   
   func testTwoSum() {
      XCTAssertEqual(self.arrays.twoSum([2, 7, 11, 15], 9), [0, 1])
      XCTAssertEqual(self.arrays.twoSum([2, 7, 11, 15], 22), [1, 3])
      XCTAssertEqual(self.arrays.twoSum([2, 7, 11, 15], 13), [0, 2])
   }
   
   func testSplitMatrixIntoSubs() {
      let in1 = [
         [1, 2, 3, 4],
         [5, 6, 7, 8],
         [9, 10, 11, 12],
         [13, 14, 15, 16]
                 ]
      let out1 = self.arrays.splitMatrixIntoSubs(in1)
      let expected = [
         [1, 2, 5, 6],
         [3, 4, 7, 8],
         [9, 10, 13, 14],
         [11, 12, 15, 16]
         ]
      XCTAssertEqual(out1, expected)
   }
   
   func testIsValidSodoku() {
      let in1: [[Character]] = [
         ["5","3",".",".","7",".",".",".","."],
         ["6",".",".","1","9","5",".",".","."],
         [".","9","8",".",".",".",".","6","."],
         ["8",".",".",".","6",".",".",".","3"],
         ["4",".",".","8",".","3",".",".","1"],
         ["7",".",".",".","2",".",".",".","6"],
         [".","6",".",".",".",".","2","8","."],
         [".",".",".","4","1","9",".",".","5"],
         [".",".",".",".","8",".",".","7","9"]
      ]
      XCTAssert(self.arrays.isValidSudoku(in1))
   }
   
   func testIsValidSodoku2() {
      let in1: [[Character]] = [
         [".",".",".",".",".",".","5",".","."],
         [".",".",".",".",".",".",".",".","."],
         [".",".",".",".",".",".",".",".","."],
         ["9","3",".",".","2",".","4",".","."],
         [".",".","7",".",".",".","3",".","."],
         [".",".",".",".",".",".",".",".","."],
         [".",".",".","3","4",".",".",".","."],
         [".",".",".",".",".","3",".",".","."],
         [".",".",".",".",".","5","2",".","."]]
      
      XCTAssertFalse(self.arrays.isValidSudoku(in1))
      
   }
   
   func testRotateInPlace() {
      var in1 = [
         [1,2,3],
         [4,5,6],
         [7,8,9]
      ]
      let out1 =
      [
         [7,4,1],
         [8,5,2],
         [9,6,3]
      ]
      self.arrays.rotate(&in1)
      XCTAssertEqual(in1, out1)
   }
}
