//https://www.hackerrank.com/challenges/crush?h_r=next-challenge&h_v=zen

import Foundation

func maxValueInArrayAfterOperations(arraySize: Int, operations: [(a: Int, b: Int, k: Int)]) -> Int
{
   //initialize array
   var array = Array(repeating: 0, count: arraySize)
   var max = 0
   for operation in operations
   {
      //do operation
      for i in operation.a-1...operation.b-1 {
         array[i] += operation.k
      }
      
      //calculate max
      if var currentRowMax = array.first
      {
         for item in array {
            if (item > currentRowMax)
            {
               currentRowMax = item
            }
         }
         max = currentRowMax
      }
   }
   return max
}

let input = readLine()!.components(separatedBy:" ").map{ Int($0)! }
let n = input[0]
let m = input[1]
var operations = [(Int, Int, Int)]()

//operations
for _ in 0..<m {
   let operation = readLine()!.components(separatedBy:" ").map{ Int($0)! }
   operations.append((operation[0], operation[1], operation[2]))
}

let max = maxValueInArrayAfterOperations(arraySize: n, operations: operations)

print("\(max)")




