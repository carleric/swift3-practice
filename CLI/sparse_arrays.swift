import Foundation

//get number of strings to expect in following lines
let numStrings = Int(readLine()!)!

//read in array of strings
var strings = [String: Int]()
for _ in 0..<numStrings {
	let newString = readLine()!
	if let occurrences = strings[newString] {
		strings[newString] = occurrences + 1
	}
	else {
		strings[newString] = 1
	}
}

//get number of strings to expect in following lines
let numQueries = Int(readLine()!)!

//perform each query
for _ in 0..<numQueries {
	let query = readLine()!
	if let occurrences = strings[query] {
		print("\(occurrences)")
	}
	else {
		print("0")
	}
}