import XCTest
@testable import Practice

class TreesAndGraphsTests: XCTestCase {
   let n1 = TreeNode(1)
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
      let n2 = TreeNode(2)
      n1.right = n2
      let n3 = TreeNode(3)
      n2.left = n3
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testInorderTraversal() {
      let traversed = TreesAndGraphs().inorderTraversal(n1)
      XCTAssertEqual(traversed.count, 3)
      XCTAssertEqual(traversed[0], 1)
      XCTAssertEqual(traversed[1], 3)
      XCTAssertEqual(traversed[2], 2)
   }
   
   func testInorderTraversal2() {
      let traversed = TreesAndGraphs().inorderTraversal2(n1)
      XCTAssertEqual(traversed.count, 3)
      XCTAssertEqual(traversed[0], 1)
      XCTAssertEqual(traversed[1], 3)
      XCTAssertEqual(traversed[2], 2)
   }
   
   func testNumIslands() {
      let grid: [[Character]] = [
         ["1", "1", "0", "0", "0"],
         ["1", "1", "0", "0", "0"],
         ["0", "0", "1", "0", "0"],
         ["0", "0", "0", "1", "1"]
         ]
      XCTAssertEqual(TreesAndGraphs().numIslands(grid), 3)
   }
   
   func testGenerateParenthesis() {
      let parens = TreesAndGraphs().generateParenthesis(3)
      XCTAssertEqual(parens.count, 5)
      XCTAssert(parens.contains("()()()"))
      XCTAssert(parens.contains("()(())"))
      XCTAssert(parens.contains("(())()"))
      XCTAssert(parens.contains("(()())"))
      XCTAssert(parens.contains("((()))"))
   }
}
