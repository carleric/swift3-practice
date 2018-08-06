//
//  ListTests.swift
//  Swift3PracticePackageDescription
//
//  Created by Carl Bolstad on 5/3/18.
//

import XCTest
@testable import Practice

class ListTests: XCTestCase {
    let l = List(1, 2, 3, 4, 5, 6)
    
    override func setUp() {
        super.setUp()
    }
    
    func testLast() {
        XCTAssert(l?.last == 6)
    }
    
    func testKthLast() {
        XCTAssert(l?.kthLast(k: 2) == 4)
    }
    
    func testPennultimate() {
        XCTAssert(l?.pennultimate == 5)
    }
    
    func testKth() {
        XCTAssert(l?[2] == 3)
    }
    
    func testLength() {
        XCTAssert(l?.length == 6)
//        let empty = List(1)
//        XCTAssert(empty?.length == 1)
    }
    
    func testReverse() {
        let r = l?.reverse()
        XCTAssert(r?.last == 1)
        XCTAssert(r?[0] == 6)
    }
}
