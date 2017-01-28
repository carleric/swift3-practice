// Design array list, and string count. - SWIFT

protocol List
{
	associatedtype itemType
	var count: Int { get }
	mutating func append(_ item: itemType)
	mutating func remove(atIndex: Int)
}

struct ArrayList<T>: List
{
	var count: Int = 0
	var items = [T]()

	mutating func append(_ item: T) {
		items.append(item)
		count += 1
	}

	mutating func remove(atIndex: Int) {
		if(atIndex < count) {
			items.remove(at: atIndex)
			count -= 1
		}
	}
}

// var myList = ArrayList<Int>()
// myList.append(1)
// assert(myList.count == 1)