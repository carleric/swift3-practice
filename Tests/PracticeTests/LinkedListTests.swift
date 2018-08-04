//
//  LinkedListTests.swift
//  PracticeTests
//
//  Created by Carl Bolstad on 7/28/18.
//

import XCTest
@testable import Practice

class LinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
   
   func testValues() {
      let l = LinkedList_LeetCode()
      let head = l.makeList([1 ,2, 3, 4, 5, 6, 7])
      XCTAssertEqual(head?.values(), [1, 2, 3, 4, 5, 6, 7])
   }
    
   func testNthFromEnd() {
      let l = LinkedList_LeetCode()
      let head = l.makeList([1 ,2, 3, 4, 5, 6, 7])
      let newHead = l.removeNthFromEnd(head, 2)
      XCTAssertEqual(newHead?.values(), [1, 2, 3, 4, 6, 7])
   }
   
   func testLLCountZero() {
      let l: LinkedList<Int> = LinkedList()
      XCTAssertEqual(l.count, 0)
   }
   
   func testLLCountIsTwo() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      XCTAssertEqual(l.count, 2)
   }
   
   func testLLFirstValue() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      XCTAssertEqual(l.first?.value, 0)
   }
   
   func testLLValueAt1() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      l.append(2)
      XCTAssertEqual(l.node(atIndex: 1)?.value, 1)
   }
   
   func testLLValueAt2() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      l.append(2)
      XCTAssertEqual(l.node(atIndex: 2)?.value, 2)
   }
   
   func testLLNodeOutsideRange() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      l.append(2)
      XCTAssertNil(l.node(atIndex: 3)?.value)
   }
   
   func testLLNodeOutsideRange2() {
      let l: LinkedList<Int> = LinkedList()
      XCTAssertNil(l.node(atIndex: 3)?.value)
   }
   
   func testReverse() {
      let l: LinkedList<Int> = LinkedList()
      l.append(0)
      l.append(1)
      l.append(2)
      l.reverse()
      XCTAssertEqual(l.node(atIndex: 0)?.value, 2)
      XCTAssertEqual(l.node(atIndex: 1)?.value, 1)
      XCTAssertEqual(l.node(atIndex: 2)?.value, 0)
   }
    
}
