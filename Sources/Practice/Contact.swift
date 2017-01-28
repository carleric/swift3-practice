// Creating a data structure = Create a collection of contacts, sort by last name, use it in SWIFT
import Foundation

protocol Person {
	var firstName: String { get }
	var middleName: String? { get }
	var lastName: String { get }
	var fullName: String { get }
	var age: Int { get set }
}

public enum NameDisplayStyle {
	case firstmiddlelast
	case lastfirst
	case initials
}

public class Contact: Person, CustomStringConvertible {
	var firstName: String
	var middleName: String?
	var lastName: String 
	var fullName: String {
		return self.toString()
	}
	var age: Int = 0

	public var description: String {
		return self.fullName
	}

	public init(firstName:String, middleName:String?, lastName:String)
	{
		self.firstName = firstName
		self.middleName = middleName
		self.lastName = lastName
	}

	public func toString(style: NameDisplayStyle = .firstmiddlelast) -> String {
		switch style {
			case .firstmiddlelast:
				if let middleName = self.middleName {
						return "\(self.firstName) \(middleName) \(self.lastName)" 
					} else {
						return "\(self.firstName) \(self.lastName)" 
					}
			case .lastfirst:
				if let middleName = self.middleName {
					return "\(self.lastName), \(self.firstName) \(middleName)"
				} else {
					return "\(self.lastName), \(self.firstName)"
				}
			case .initials:
				if let middleName = self.middleName {
					return "\(self.firstName.characters[self.firstName.startIndex])\(middleName.characters[middleName.startIndex])\(self.lastName.characters[self.lastName.startIndex])"
				} else {
					return "\(self.firstName.characters[self.firstName.startIndex])\(self.lastName.characters[self.lastName.startIndex])"
				}
		}
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

extension String
{   
    func trim() -> String
    {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}


//tests
/*
let contacts: [Contact] =  [Contact(firstName:"Dan", middleName:nil, lastName:"Johnson"),
							Contact(firstName:"Carl", middleName:"Eric", lastName:"Bolstad"),
							Contact(firstName:"Bob", middleName:nil, lastName:"Rogers"),
							Contact(firstName:"Edna", middleName:nil, lastName:"Zimmerman"),
							Contact(firstName:"Tim", middleName:nil, lastName:"Weimann")]

for contact in contacts.sorted() {
	//print("\(contact)")
	print(contact.toString(style:NameDisplayStyle.lastfirst))
}

var contact1 = Contact(firstName:"Dan", middleName:nil, lastName:"Johnson")
var contact2 = contact1
contact2.age = 42
assert(contact1.age == 42)

*/