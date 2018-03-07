// write a data structure in Swift that represents a Contact.  It should contain
// firstname, lastname, email, phone.  Write a test that creates a collection of
// Contact, sorts them by last name, and prints the full name (firstname lastname).
import Foundation

protocol Contactable {
	var firstName: String { get }
	var lastName: String { get }
	var fullName: String { get }
}

public struct Contact: Contactable {
	var firstName: String
	var lastName: String
	var fullName: String {
		return "\(firstName) \(lastName)"
	}
}

extension Contact: Comparable {
	public static func < (lhs: Contact, rhs: Contact) -> Bool {
		return lhs.lastName < rhs.lastName
	}

	public static func == (lhs: Contact, rhs: Contact) -> Bool {
		return lhs.lastName == rhs.lastName
	}
}

extension Contact: CustomStringConvertible {
    public var description: String {
        return self.fullName
    }
}

//tests
/*
 let contacts = [Contact(firstName:"Bob", lastName:"Pullman"),
                 Contact(firstName:"Dan", lastName:"Zimmerman"),
                 Contact(firstName:"Alex", lastName:"Johnson"),
                 Contact(firstName:"Carl", lastName:"Bolstad")]
                 }
 
 contacts.sorted().forEach({print($0)})
*/
