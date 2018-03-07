//https://www.hackerrank.com/challenges/apple-and-orange?h_r=next-challenge&h_v=zen
import Foundation

func readLineToIntTuple() -> (Int, Int) {
	let st = readLine()!.components(separatedBy: " ").map{ Int($0)! }
	return (st[0], st[1])	
}

let (s, t) = readLineToIntTuple() //edges of house
let (a, b) = readLineToIntTuple() //points of apple tree, orange tree
let (m, n) = readLineToIntTuple() //# of apples, # of oranges fallen

//distances
let apple_to_house = s - a
let house_to_orange = t - b 

//counts
var apples_on_house = 0
var oranges_on_house = 0

//apples
let appledrops = readLine()!.components(separatedBy:" ").map{ Int($0)!}
for i in 0..<m {
   let dropLocation = appledrops[i] + a
	if (dropLocation >= s && dropLocation <= t)
   {
		apples_on_house += 1
	}
}

//oranges
let orangedrops = readLine()!.components(separatedBy:" ").map{ Int($0)!}
for i in 0..<n {
   let dropLocation = orangedrops[i] + b
	if (dropLocation <= t && dropLocation >= s)
   {
		oranges_on_house += 1
	}
}

print("\(apples_on_house)")
print("\(oranges_on_house)")

