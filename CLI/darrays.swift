//dynamic arrays
// https://www.hackerrank.com/challenges/dynamic-array
import Foundation

// read counts
let input = readLine()!
let counts = input.components(separatedBy: " ").map{ Int($0)! }
let N = counts[0]
let Q = counts[1]
var lastAns = 0
var S = [[Int]]()
//print("N=\(N) Q=\(Q)")

//initialiaze S
for i in 0..<N {
    S.append([])
}

//do queries
for _ in 0..<Q {
    let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let type = input[0]

    //if valid query type
    if(type >= 1 && type <= 2)
    {
        let x = input[1]
        let y = input[2]
        
        let index = (x ^ lastAns ) % N
        //print("type=\(type) x=\(x) y=\(y) index=\(index)")

        if (index >= 0 && index < N) {
            //query type 1
            if (type == 1) {
                S[index].append(y)
            }
                
            //query type 2
            else if (type == 2) {
                let S2index = y % S[index].count
                lastAns = S[index][S2index]
                print(lastAns)
            }
        }
    }
}