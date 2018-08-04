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
   
   func testMaxProfit() {
      XCTAssertEqual(Dynamic().maxProfit([7,1,5,3,6,4]), 5)
      XCTAssertEqual(Dynamic().maxProfit([7,6,4,3,1]), 0)
   }
   
   func testMaxSubArray() {
      XCTAssertEqual(Dynamic().maxSubArray([-2,1,-3,4,-1,2,1,-5,4]), 6)
   }
   
   func testRob() {
      XCTAssertEqual(Dynamic().rob([9, 0, 0, 9]), 18)
      XCTAssertEqual(Dynamic().rob([0]), 0)
   }
}
