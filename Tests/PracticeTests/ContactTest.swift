import XCTest
@testable import Practice

class ContactTests: XCTestCase {
  var contact : Contact!
  var contact2 : Contact!

  override func setUp() {
    super.setUp()
    self.contact = Contact(firstName:"Dan", middleName:nil, lastName:"Johnson")
    self.contact2 = Contact(firstName:"Bob", middleName:"Edward", lastName:"Lewis")
  }

  func testIsReferenceType() {
    let temp = self.contact
    temp!.age = 42
    XCTAssert(contact.age == 42)
  }

  func testAge() {
    let temp = self.contact
    temp!.age = 42
    XCTAssert(contact.age == 42)
    XCTAssert(contact2.age == 0)
  }

  func testRender1() {
    XCTAssert(contact.toString(style:.firstmiddlelast) == "Dan Johnson")
    XCTAssert(contact2.toString(style:.firstmiddlelast) == "Bob Edward Lewis")
  }

  func testRender2() {
    XCTAssert(contact.toString(style:.lastfirst) == "Johnson, Dan")
    print(contact2.toString(style:.lastfirst))
    XCTAssert(contact2.toString(style:.lastfirst) == "Lewis, Bob Edward")
  }

  func testRender3() {
    XCTAssert(contact.toString(style:.initials) == "DJ")
    XCTAssert(contact2.toString(style:.initials) == "BEL")
  }

  func testFullName() {
    XCTAssert(contact.fullName == "Dan Johnson")
    XCTAssert(contact2.fullName == "Bob Edward Lewis")
  }
}