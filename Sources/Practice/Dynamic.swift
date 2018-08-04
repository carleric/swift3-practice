//
//  Dynamic.swift
//  Practice
//
//  Created by Carl Bolstad on 7/29/18.
//
import Foundation

class Dynamic {
   
   // problem 8.1 in CtCI
   // can climb 1, 2 or 3 steps at a time
   var numWays = [0: 0, 1: 1, 2: 2, 3: 4]
   
   func numWaysToClimbStairsOfHeight(_ h: Int) -> Int {
      if numWays[h] != nil {
         return numWays[h]!
      } else {
         let s = numWaysToClimbStairsOfHeight(h - 1) + numWaysToClimbStairsOfHeight(h - 2) + numWaysToClimbStairsOfHeight(h - 3)
         numWays[h] = s
         return s
      }
   }
   
   // problem 8.2 in CtCI
   func getPath(maze:[[Bool]]) -> [(Int, Int)]? {
      var path = [(Int, Int)]()
      var failed = [(Int, Int)]()
      if getPath(row: maze.count - 1, col: maze.count - 1, maze: maze, path: &path, failed: &failed) {
         return path
      } else {
         return nil
      }
   }
   
   // tries to find a path to 0, 0 from current row/col passed in
   func getPath(row: Int, col: Int, maze:[[Bool]], path: inout [(Int, Int)], failed: inout [(Int, Int)]) -> Bool {
      if row < 0 || col < 0 || !maze[row][col] || failed.contains(where: { (point) -> Bool in
         return row == point.0 && col == point.1
      }){
         return false
      }
      
      let isAtOrigin = row == 0 && col == 0
      
      if isAtOrigin
         || getPath(row: row - 1, col: col, maze: maze, path: &path, failed: &failed)
         || getPath(row: row, col: col - 1, maze: maze, path: &path, failed: &failed) {
         let p = (row, col)
         path.append(p)
         return true
      }
      failed.append((row, col))
      return false
   }
   
   // 8.4
   func getSubsets(_ set: Set<Int>) -> [Set<Int>] {
      let size = set.count
      let numSubsets = 1 << size //2 ^ size
      var subSets = [Set<Int>]()
      
      for i in 0..<numSubsets {
         subSets.append(getSubsetFor(i, set: set))
      }
      return subSets
   }
   
   // each int, when represented as binary,
   // can indicate a unique combination of set
   // 00000,
   // membership.  example 3 -> 0011, applied to [0, 1, 2, 3)
   // results in subset [2, 3]
   func getSubsetFor(_ int: Int, set: Set<Int>) -> Set<Int> {
      var subSet = Set<Int>()
      
      //iterate through each bit of int, from left to right
      for (i, value) in set.enumerated() {
         if shouldInclude(int: int, shiftedBy: i) {
            subSet.insert(value)
         }
      }
      return subSet
   }
   
   // given 3, 0011: shifted by 1, should return true
   func shouldInclude(int: Int, shiftedBy: Int) -> Bool {
      var shifted = int
      shifted >>= shiftedBy
      
      let s = shifted & 1 == 1
      print("int=\(int) shiftedBy=\(shiftedBy) shouldInclude=\(s)")
      return s
   }
   
   //   Say you have an array for which the ith element is the price of a given stock on day i.
   //
   //   If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
   //
   //   Note that you cannot sell a stock before you buy one.
   //
   //   Example 1:
   //
   //   Input: [7,1,5,3,6,4]
   //   Output: 5
   func maxProfit(_ prices: [Int]) -> Int {
      var max = 0
      for i in 0..<prices.count {
         for j in i+1..<prices.count {
            let p = prices[j] - prices[i]
            if p > max {
               max = p
            }
         }
      }
      return max
   }
   
   // example: [-2,1,-3,4,-1,2,1,-5,4] , 6
   func maxSubArray(_ nums: [Int]) -> Int {
      var dp: [Int] = Array(repeating: 0, count: nums.count)
      dp[0] = nums[0]
      var maxSub = dp[0]
      for i in 1..<nums.count {
         dp[i] = nums[i] + (dp[i-1] > 0 ? dp[i-1] : 0)
         maxSub = max(maxSub, dp[i])
      }
      return maxSub
   }
   
   func rob(_ nums: [Int]) -> Int {
      guard !nums.isEmpty else {
         return 0
      }
      if nums.count < 3 {
         return nums.max()!
      }
      var result = nums
      for i in 2 ..< result.count {
         result[i] = result[i] + result[0...i-2].max()!
      }
      return result.max()!
   }
}
