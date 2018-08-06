//
//  DynamicTests.swift
//  Practice
//
//  Created by Carl Bolstad on 7/29/18.
//

import XCTest
@testable import Practice

class DynamicTests: XCTestCase {
   
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }
   
   override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
      super.tearDown()
   }
   
   func testNumWaysToClimbStairsOfHeight() {
      XCTAssertEqual(Dynamic().numWaysToClimbStairsOfHeight(5), 13)
      XCTAssertEqual(Dynamic().numWaysToClimbStairsOfHeight(6), 24)
      XCTAssertEqual(Dynamic().numWaysToClimbStairsOfHeight(7), 44)
   }
   
//   func testCanMove() {
//      XCTAssertFalse(Dynamic().canMove(p: (0, 0), d: (1, 0), s: (3, 3), o: [(1, 0)]))
//      XCTAssertFalse(Dynamic().canMove(p: (0, 1), d: (0, 1), s: (3, 3), o: [(0, 2)]))
//      XCTAssertTrue(Dynamic().canMove(p: (0, 0), d: (1, 0), s: (3, 3), o: [(1, 1)]))
//   }
   
   func testGetPath() {
      if let path = Dynamic().getPath(maze: [[true, false, true, true, true],
                                           [true, false, true, true, true],
                                           [true, false, true, true, true],
                                           [true, true, true, false, true],
                                           [true, false, true, true, true]])
      {
         //[(0, 0), (1, 0), (2, 0), (3, 0), (3, 1), (3, 2), (4, 2), (4, 3), (4, 4)])
         XCTAssertEqual(path[4].0, 3)
         XCTAssertEqual(path[4].1, 1)
      } else {
         XCTFail("path shouldn't be nil")
      }
   }
   
   func testShouldInclude() {
      XCTAssertTrue(Dynamic().shouldInclude(int: 3, shiftedBy: 1)) // 0011
      XCTAssertFalse(Dynamic().shouldInclude(int: 3, shiftedBy: 2))
      XCTAssertTrue(Dynamic().shouldInclude(int: 4, shiftedBy: 2))
   }
   
   func testGetSubsets1() {
      let set: Set<Int> = [0, 1, 2]
      let found = Dynamic().getSubsets(set)
      XCTAssertEqual(found.count, 8)
      XCTAssert(found.contains([]))
      XCTAssert(found.contains([0]))
      XCTAssert(found.contains([1]))
      XCTAssert(found.contains([2]))
      XCTAssert(found.contains([0, 1]))
      XCTAssert(found.contains([0, 2]))
      XCTAssert(found.contains([1, 2]))
      XCTAssert(found.contains([0, 1, 2]))
   }
   
   func testMaxProfitOneTransaction() {
      XCTAssertEqual(Dynamic().maxProfitOneTransaction([7,1,5,3,6,4]), 5)
      XCTAssertEqual(Dynamic().maxProfitOneTransaction([7,6,4,3,1]), 0)
   }
   
   func testMaxProfitMultiTransaction() {
      XCTAssertEqual(Dynamic().maxProfitMultiTransaction([7,1,5,3,6,4]), 7)
      XCTAssertEqual(Dynamic().maxProfitMultiTransaction([7,6,4,3,1]), 0)
   }
   
   func testMaxProfitWithCooldown() {
      XCTAssertEqual(Dynamic().maxProfitWithCooldown([]), 0)
      XCTAssertEqual(Dynamic().maxProfitWithCooldown([1,2,3,0,2]), 3)
   }
   
   func testMaxSubArray() {
      XCTAssertEqual(Dynamic().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
   }
   
   func testRob() {
      XCTAssertEqual(Dynamic().rob([9, 0, 0, 9]), 18)
      XCTAssertEqual(Dynamic().rob([0]), 0)
   }
   
   func testGetPerms2() {
      //// at -> at, ta
      let perms = Dynamic().getPerms("at")
      XCTAssertEqual(perms.count, 2)
      XCTAssert(perms.contains("at"))
      XCTAssert(perms.contains("ta"))
   }
   
   func testGetPerms3() {
      //// cat -> tca, cta, cat, tac, atc, act
      let perms = Dynamic().getPerms("cat")
      XCTAssertEqual(perms.count, 6)
      XCTAssert(perms.contains("cat"))
      XCTAssert(perms.contains("tca"))
      XCTAssert(perms.contains("cta"))
      XCTAssert(perms.contains("tac"))
      XCTAssert(perms.contains("atc"))
      XCTAssert(perms.contains("act"))
   }
   
   func testGetCountPerms() {
      XCTAssertEqual(Dynamic().getCountPerms("cat"), 6)
      XCTAssertEqual(Dynamic().getCountPerms("catd"), 24)
      XCTAssertEqual(Dynamic().getCountPerms("catdo"), 120)
   }
   
   func testChange1() {
      XCTAssertEqual(Dynamic().change(4, [1 ,2, 4]), 4)
   }
   
   func testChange2() {
      XCTAssertEqual(Dynamic().change(50, [1 ,5, 10, 25]), 49)
   }
   
   func testChange3() {
      XCTAssertEqual(Dynamic().change(0, [7]), 1)
   }
   
   func testChange4() {
      XCTAssertEqual(Dynamic().change(0, []), 1)
   }
   
   func testChangeRecursive1() {
      XCTAssertEqual(Dynamic().changeRecursive(4, [1 ,2, 4], 0), 4)
   }
   
   func testChangeRecursive2() {
      XCTAssertEqual(Dynamic().changeRecursive2(4, [1 ,2, 4]), 4)
   }
   
   func testMaxProduct() {
      XCTAssertEqual(Dynamic().maxProduct([2, 3, -2, 4]), 6)
   }
   
   func testMaxProductWithNeg() {
      XCTAssertEqual(Dynamic().maxProduct([-2]), -2)
   }
   
   func testMaxProductWith2Neg() {
      XCTAssertEqual(Dynamic().maxProduct([-2, 3, -4]), 24)
   }
   
   func testMaxProductWith3Neg() {
      XCTAssertEqual(Dynamic().maxProduct([-2, 3, -4, 0, 3, 2]), 24)
   }
   
   func testMaxProductWith2NegAnd0() {
      XCTAssertEqual(Dynamic().maxProduct([-2, 0, -1]), 0)
   }
   
   func testMaxProductWith02() {
      XCTAssertEqual(Dynamic().maxProduct([0, 2]), 2)
   }
   
   func testMaxProductWith3m14() {
      XCTAssertEqual(Dynamic().maxProduct([3, -1, 4]), 4)
   }
   
   func testMaxProductWith3Neg2() {
      XCTAssertEqual(Dynamic().maxProduct([-4,-3,-2]), 12)
   }
   
   func testMaxProductWith4Neg() {
      XCTAssertEqual(Dynamic().maxProduct([-1, -2, -9, -6]), 108)
   }
}
