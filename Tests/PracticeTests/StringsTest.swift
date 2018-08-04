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
   
   func testReverse() {
      XCTAssertEqual(self.strings.reverse(123), 321)
      XCTAssertEqual(self.strings.reverse(-123), -321)
      XCTAssertEqual(self.strings.reverse(1534236469), 0)
   }
   
   func testFirstUniqueChar() {
      XCTAssertEqual(self.strings.firstUniqChar("leetcode"), 0)
      XCTAssertEqual(self.strings.firstUniqChar("lleetcode"), 4)
   }
   
   func testIsAnagram() {
      XCTAssert(self.strings.isAnagram("anagram", "naagram"))
      XCTAssertFalse(self.strings.isAnagram("anagram", "naagramm"))
   }
   
   func testIsPalindrome() {
      XCTAssert(self.strings.isPalindrome("A man, a plan, a canal: Panama"))
      XCTAssertFalse(self.strings.isPalindrome("Race a car"))
      XCTAssertFalse(self.strings.isPalindrome("0P"))
   }
   
   func testmyAtoi1() {
      XCTAssertEqual(self.strings.myAtoi("-3482"), -3482)
     
   }
   func testmyAtoi2() {
      XCTAssertEqual(self.strings.myAtoi("4193 with words"), 4193)
   }
   
   func testmyAtoi3() {
      XCTAssertEqual(self.strings.myAtoi("words and 987"), 0)
   }
   
   func testmyAtoi4() {
      XCTAssertEqual(self.strings.myAtoi("-91283472332"), -2147483648)
   }
   
   func testmyAtoi5() {
      XCTAssertEqual(self.strings.myAtoi("3.14159"), 3)
   }
   
   func testmyAtoi6() {
      XCTAssertEqual(self.strings.myAtoi("+1"), 1)
   }
   
   func testmyAtoi7() {
      XCTAssertEqual(self.strings.myAtoi("+-2"), 0)
   }
   
   func testmyAtoi8() {
       XCTAssertEqual(self.strings.myAtoi("+-+-+-"), 0)
   }
   
   func testmyAtoi9() {
      XCTAssertEqual(self.strings.myAtoi("     -42"), -42)
   }
   
   func testmyAtoi10() {
      XCTAssertEqual(self.strings.myAtoi("2147483648"), 2147483647)
   }
   
   func testStrStr1() {
      XCTAssertEqual(self.strings.strStr("boolalardy", "lal"), 3)
   }
   
   func testStrStr2() {
      XCTAssertEqual(self.strings.strStr("mississippi", "issip"), 4)
   }
   
   func testStrStr3() {
      XCTAssertEqual(self.strings.strStr("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", "ab"), 58)
   }
}
