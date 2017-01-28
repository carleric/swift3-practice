//https://www.hackerrank.com/challenges/designer-pdf-viewer
import Foundation

let alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z".components(separatedBy: " ").map{ Character($0) }
let heights = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let word:String = readLine()!

var charHeightMap = [Character:Int]()
for i in 0..<heights.count {
	charHeightMap[alphabet[i]] = heights[i]
}

var tallest = 1
for char in word.characters {
	if let heightOfChar = charHeightMap[char]
	{
		if (heightOfChar > tallest) {
			tallest = heightOfChar
		}
	}
}

let areaOfWord = tallest * word.characters.count 
print(areaOfWord)
