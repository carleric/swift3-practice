// Merging two sorted arrays

import Foundation

let array1 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let array2 = readLine()!.components(separatedBy: " ").map{ Int($0)! }
var array3: [Int] = [Int]()

var i = 0
var j = 0

while i < array1.count && j < array2.count {
	if array1[i] < array2[j] {
		array3.append(array1[i])
		i += 1
	} else {
		array3.append(array2[j])
		j += 1	
	}
	
}

while i < array1.count 
{
	array3.append(array1[i])
	i += 1
}

while j < array2.count 
{
	array3.append(array2[j])
	j += 1
}

print(array3.map{ String(describing:$0) }.joined(separator: " "))
