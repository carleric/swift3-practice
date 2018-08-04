import XCTest
@testable import Practice

class ContactTests: XCTestCase
{
  var contacts = [Contact]()

  override func setUp() {
    super.setUp()
    self.contacts = [Contact(firstName:"Bob", lastName:"Pullman"),
                     Contact(firstName:"Dan", lastName:"Zimmerman"),
                     Contact(firstName:"Alex", lastName:"Johnson"),
                     Contact(firstName:"Carl", lastName:"Bolstad")]
  }

  func testSortAndRender() {
    self.contacts.sorted().forEach({print($0)})
  }

}
