//https://www.hackerrank.com/challenges/array-left-rotation?h_r=next-challenge&h_v=zen
import Foundation

let config = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let elementCount = config[0]
let rotationCount = config[1]

var elements = readLine()!.components(separatedBy: " ").map{ Int($0)! }

for _ in 0..<rotationCount {
	elements.append(elements[0])
	elements.remove(at:0)
}

print(elements.map{ String(describing:$0) }.joined(separator:" "))