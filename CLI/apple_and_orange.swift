//https://www.hackerrank.com/challenges/apple-and-orange?h_r=next-challenge&h_v=zen
import Foundation

func readLineToIntTuple() -> (Int, Int) {
	let st = readLine()!.components(separatedBy: " ").map{ Int($0)! }
	return (st[0], st[1])	
}

let (s, t) = readLineToIntTuple()
let (a, b) = readLineToIntTuple()
let (m, n) = readLineToIntTuple()

//distances
let apple_to_house = s - a
let house_to_orange = t - b 

//counts
var apples_on_house = 0
var oranges_on_house = 0

//apples
let appledrops = readLine()!.components(separatedBy:" ").map{ Int($0)!}
for i in 0..<m {
	if (appledrops[i] + a) >= s {
		apples_on_house += 1
	}
}

//oranges
let orangedrops = readLine()!.components(separatedBy:" ").map{ Int($0)!}
for i in 0..<n {
	if (orangedrops[i] + b) <= t {
		oranges_on_house += 1
	}
}

print("\(apples_on_house)")
print("\(oranges_on_house)")

