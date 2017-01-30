import XCTest
@testable import Practice

class BinaryTreeTests: XCTestCase {
	var binaryTree: BinaryTree!

	override func setUp() {
		super.setUp()
		self.binaryTree = BinaryTree()
		self.binaryTree.insertValue(5)
		self.binaryTree.insertValue(3)
		self.binaryTree.insertValue(4)
		self.binaryTree.insertValue(5)
		self.binaryTree.insertValue(7)
		self.binaryTree.insertValue(10)
	}	

	func testInsert() {
		
		XCTAssert(self.binaryTree.count == 5)
	}

	func testPreOrder() {
		let ordered = self.binaryTree.preOrderVisit()
		XCTAssert(ordered[0] == 5)
		XCTAssert(ordered[1] == 3)
		XCTAssert(ordered[2] == 4)
		XCTAssert(ordered[3] == 7)
		XCTAssert(ordered[4] == 10)
	}

	func testInOrder() {
		let ordered = self.binaryTree.inOrderVisit()
		XCTAssert(ordered[0] == 3)
		XCTAssert(ordered[1] == 4)
		XCTAssert(ordered[2] == 5)
		XCTAssert(ordered[3] == 7)
		XCTAssert(ordered[4] == 10)
	}

	func testPostOrder() {
		let ordered = self.binaryTree.postOrderVisit()
		XCTAssert(ordered[0] == 4)
		XCTAssert(ordered[1] == 3)
		XCTAssert(ordered[2] == 10)
		XCTAssert(ordered[3] == 7)
		XCTAssert(ordered[4] == 5)
	}
}