//Write a function that gives lists of anagrams, given a list of strings
import Foundation

public class Strings {

	public func getAnagramsIn(strings: [String]) -> [String] {
		var anagrams = [String]()
		for string in strings {
			var leftIndex = string.startIndex
			var rightIndex = string.index(before:string.endIndex)
			while true {
				//fail case, this string doesn't have symmetry
				if(string[leftIndex] !=  string[rightIndex]) {
					break
				}
				//success case, pointers have reached the middle
				if ( ( (string.count % 2 == 0) &&
					 (leftIndex == string.index(before:rightIndex)) )
				   || ( (string.count % 2 != 0) &&
					 (rightIndex == string.index(leftIndex, offsetBy:2)) ))
				{
					anagrams.append(string)
					break
				}
				//increment pointers towards center
				leftIndex = string.index(after:leftIndex)
				rightIndex = string.index(before:rightIndex)
			}
		}
		return anagrams
	}
}
