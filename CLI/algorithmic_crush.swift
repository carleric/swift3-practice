//https://www.hackerrank.com/challenges/crush?h_r=next-challenge&h_v=zen

import Foundation

let input = readLine()!.components(separatedBy:" ").map{ Int($0)! }
let n = input[0]
let m = input[1]

var max = 0

//initialize
var array: [Int] = [Int]()
for i in 0..<n {
	array.append(0)
}

//operations
for j in 0..<m {
	let operation = readLine()!.components(separatedBy:" ").map{ Int($0)! }
	let a = operation[0]
	let b = operation[1]
	let k = operation[2]

	for i in a-1..<b-1 {
		array[i] += k
		max = array[i] > max ? array[i] : max
	}
}

print("\(max)")