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
   
   public func getAnagramsIn2(strings: [String]) -> [String] {
      var anagrams = [String]()
      for string in strings {
         if (string == String(string.reversed())) {
            anagrams.append(string)
         }
      }
      return anagrams
   }
   
   // Following questions are from https://leetcode.com/explore/interview/card/top-interview-questions-easy/127/strings/880/
   
   func reverse(_ x: Int) -> Int {
      let isNeg = x < 0
      var usResult = Int(String(String(abs(x)).reversed())) ?? 0
      usResult = usResult > Int(pow(2.0, 31)) ? 0 : usResult
      return isNeg ? usResult * -1 : usResult
   }
   
   func firstUniqChar(_ s: String) -> Int {
      if s.count == 0 { return -1 }
      
      var foundCharCount = [Character: Int]()
      
      for c in s {
         let charCount = foundCharCount[c] ?? 0
         foundCharCount[c] = charCount + 1
      }
      
      for (i, c) in s.enumerated() {
         if (foundCharCount[c] == 1) {
            return i
         }
      }
      return -1
   }
   
   func isAnagram(_ s: String, _ t: String) -> Bool {
      return s.sorted() == t.sorted()
   }
   
   func isPalindrome(_ s: String) -> Bool {
      let trimmingSets = CharacterSet.alphanumerics.inverted
      let trimmed = String(s.filter { (c) -> Bool in
         return !trimmingSets.contains(UnicodeScalar(String(c))!)
      }).lowercased()
      return trimmed == String(trimmed.reversed())
   }
   
   func myAtoi1(_ str: String) -> Int {
      //trim whitespace
      var converted: String = String(str.trimmingCharacters(in: CharacterSet.whitespaces))
      if converted.count == 0 || converted == "0" || converted == "-" || converted == "+" { return  0 }
      
      let negCharSet = CharacterSet.init(charactersIn: "-+")
      let allowedFirst = CharacterSet.decimalDigits.union(negCharSet)
      //numeric or - are the only allowed first character
      if !allowedFirst.contains(UnicodeScalar(String(converted.first!))!) { return 0 }
      
      //2nd char must be numeric
      if converted.count > 1 {
         let char2 = converted[converted.index(converted.indices.first!, offsetBy: 1)]
         let allowedSecond = CharacterSet.decimalDigits.union(CharacterSet.init(charactersIn: "."))
         if !allowedSecond.contains(UnicodeScalar(String(char2))!) { return 0 }
      }
      
      //trim non-numeric
      var trimSet = CharacterSet.decimalDigits.inverted
      trimSet.remove(UnicodeScalar("-"))
      
      //zero cases
      converted = String(str.trimmingCharacters(in: trimSet)) ?? "0"
      if converted.count == 0 || converted == "0" { return  0 }
      
      //is neg
      var isNeg = false
      if converted.first == "-" {
         isNeg = true
         converted.remove(at: converted.indices.first!)
      }
      
      //convert
      var convertedDouble = Double(converted) ?? 0.0
      convertedDouble = convertedDouble > pow(2.0, 31) ? 2147483648.0 : convertedDouble
      let convertedInt = Int(convertedDouble)
      
      return isNeg ? -1 * convertedInt : convertedInt
   }
   
   func myAtoi(_ str: String) -> Int {
      let signedCharSet = CharacterSet.init(charactersIn: "-+")
      var signChar: String?
      
      //trim whitespace
      var converted = ""
      let stripped: String = String(str.trimmingCharacters(in: CharacterSet.whitespaces))

      for c in stripped {
         
         //test for sign
         guard let uniChar = UnicodeScalar(String(c)) else { return 0 }
         if signedCharSet.contains(uniChar) {
            if  signChar == nil  && converted.count == 0 {
               signChar = String(c)
            } else {
               return 0
            }
         }
         
         //test for numeric
         else if CharacterSet.decimalDigits.contains(uniChar) {
            converted.append(c)
         }
         
         //test for decimal
         else if CharacterSet.init(charactersIn: ".").contains(uniChar) {
            if converted.count > 0 {
               converted.append(c)
            } else {
               return 0
            }
         }
         
         //test for non-numeric before numeric
         else if CharacterSet.decimalDigits.inverted.contains(uniChar) && converted.count == 0 {
            return 0
         }
            
         //test for non-numeric after numeric
         else if CharacterSet.decimalDigits.inverted.contains(uniChar) && converted.count > 0 {
            break
         }
         
         //ignore whitespace, non-numeric prefixes
      }
      
      //is neg
      let isNeg = signChar == "-"
      
      //convert
      var convertedDouble = Double(converted) ?? 0.0
      if !isNeg && convertedDouble > pow(2.0, 31) - 1 {
         convertedDouble = 2147483647.0
      } else if isNeg && convertedDouble > pow(2.0, 31) {
         convertedDouble = 2147483648.0
      }
      let convertedInt = Int(convertedDouble)
      return isNeg ? -1 * convertedInt : convertedInt
   }
   
   // return -1 if not found
   // return 0 if needle is empty
   func strStr(_ haystack: String, _ needle: String) -> Int {
      if needle.count == 0 { return 0 }
      if haystack.count == 0 { return -1 }
      var needleIndex = needle.startIndex
      var countMatches = 0
      var hayStackIndex = haystack.startIndex
      while hayStackIndex < haystack.endIndex {
         let c = haystack[hayStackIndex]
         
         print("comparing haystack=\(c) to \(needle[needleIndex]) at index=\(haystack.distance(from: haystack.startIndex, to: hayStackIndex))")
         if c == needle[needleIndex] {
            countMatches += 1
            needleIndex = needle.index(after: needleIndex)
         } else if needleIndex != needle.indices.first! {
            print("failed match, reset")
            needleIndex = needle.indices.first!
            // reset to position just after failed match
            hayStackIndex = haystack.index(hayStackIndex, offsetBy: -countMatches)
            countMatches = 0
         }
         
         //success
         if countMatches == needle.count {
            let index = haystack.distance(from: haystack.startIndex, to: hayStackIndex)
            return index - needle.count + 1
         }
         
         hayStackIndex = haystack.index(after: hayStackIndex)
      }
      return -1
   }
}
