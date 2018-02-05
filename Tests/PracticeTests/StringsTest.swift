import XCTest
@testable import Practice

class StringsTests: XCTestCase {
	var strings: Strings!
	var data1 = ["aba", "toolloot", "turkey", "chicken", "overrevo"]

	override func setUp() {
		super.setUp()
		self.strings = Strings()
	}

	func testFilterAnagrams() {
		let anagrams = self.strings.getAnagramsIn2(strings:data1)
		XCTAssert(anagrams.count == 3)
		XCTAssert(anagrams.contains("aba"))
		XCTAssert(anagrams.contains("toolloot"))
		XCTAssert(anagrams.contains("overrevo"))
		XCTAssertFalse(anagrams.contains("turkey"))
		XCTAssertFalse(anagrams.contains("chicken"))
	}
}
