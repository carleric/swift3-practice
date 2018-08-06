import XCTest
@testable import Practice

class NumbersTests: XCTestCase {
    
    let inputs: [Float] = [1, 4, 9, 16]
    let solutions: [Float] = [1, 2, 3, 4]
    
    override func setUp() {
        super.setUp()
    }
    
    func testSquareRoot1() {
        for (index, input) in inputs.enumerated() {
            let solution = Numbers.squareRoot1(input)
            XCTAssert(solution == solutions[index])
        }
    }
    
    func testSquareRoot2() {
        for (index, input) in inputs.enumerated() {
            let solution = Numbers.squareRoot2(input)
            XCTAssert(solution == solutions[index])
        }
    }
}
