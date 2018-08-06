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
   //   If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
   //   Note that you cannot sell a stock before you buy one.
   //
   //   Example 1:
   //   Input: [7,1,5,3,6,4]
   //   Output: 5
   func maxProfitN2(_ prices: [Int]) -> Int {
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
   
   // find max profit.  Only allowed one buy and one sell.
   func maxProfitOneTransaction(_ prices: [Int]) -> Int {
   // with this approach, simply find largest min and max, where min occurred before max in the array
      guard prices.count > 0 else { return 0 }
      var cMax = prices[0]
      var cMin = prices[0]
      for i in 1 ..< prices.count {
         let current = prices[i]
         if current < cMin {
            cMin = current
            cMax = current
         }
         if current > cMax {
            cMax = current
         }
      }
      return cMax - cMin
   }
   
   
//   Say you have an array for which the ith element is the price of a given stock on day i.
//
//   Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times) with the following restrictions:
//
//   You may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).
//   After you sell your stock, you cannot buy stock on next day. (ie, cooldown 1 day)
//   Example:
//
//   Input: [1,2,3,0,2]
//   Output: 3
//   Explanation: transactions = [buy, sell, cooldown, buy, sell]
   func maxProfitWithCooldown(_ prices: [Int]) -> Int {
      guard prices.count > 0 else { return 0 }
      // 3 possible states, with 3 actions to transition between: buy, rest, sell:
      // s0: rest state; can only buy or rest
      // s1: bought state: can only rest or sell
      // s2: sold: must rest, before transition  to s0 again
      
      // initialize states, they represent possible profit at any step through prices
      var s0 = Array(repeating: 0, count: prices.count)
      s0[0] = 0
      var s1 = Array(repeating: 0, count: prices.count)
      s1[0] = 0 - prices[0] // represents case where buy in first price
      var s2 = Array(repeating: 0, count: prices.count)
      s2[0] = 0
      
      for i in 1 ..< prices.count {
         let price = prices[i]
         s0[i] = max(s0[i-1], s2[i-1])
         s1[i] = max(s0[i-1] - price, s1[i-1]) // note that s2 is not included, because we must rest before buying again
         s2[i] = s1[i-1] + price
      }
      
      return max(s0[prices.count - 1], s2[prices.count - 1])
   }
   
   // find max profit, allowed any number of buy and sell
   // use same state machine approach discovered in last problem
   func maxProfitMultiTransaction(_ prices: [Int]) -> Int {
      guard prices.count > 0 else { return 0 }
      // 3 possible states, with 3 actions to transition between: buy, rest, sell:
      // s0: rest state; can only buy or rest
      // s1: bought state: can only rest or sell
      // s2: sold: can either buy or rest
      
      // initialize states, they represent possible profit at any step through prices
      var s0 = Array(repeating: 0, count: prices.count)
      s0[0] = 0
      var s1 = Array(repeating: 0, count: prices.count)
      s1[0] = 0 - prices[0] // represents case where buy in first price
      var s2 = Array(repeating: 0, count: prices.count)
      s2[0] = 0
      
      for i in 1 ..< prices.count {
         let price = prices[i]
         s0[i] = max(s0[i-1], s2[i-1])
         s1[i] = max(s0[i-1] - price, s1[i-1], s2[i-1] - price) // note that s2 is not included, because we must rest before buying again
         s2[i] = s1[i-1] + price
      }
      
      return max(s0[prices.count - 1], s2[prices.count - 1])
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
   
   // c   -> c
   // ca  -> ca, ac (2)
   // cat -> tca, cta, cat, tac, atc, act (6)
   // catd -> (24)
   func getPerms(_ s: String) -> [String] {
      if s.count < 2 {
         return [s]
      }
      var p = [String]()
      var chopped = s
      let firstChar = chopped.removeFirst()
      let subPerms = getPerms(chopped)
      for var subPerm in subPerms {
         for i in subPerm.indices {
            subPerm.insert(firstChar, at: i)
            p.append(subPerm)
            subPerm.remove(at: i)
         }
         subPerm.append(firstChar)
         p.append(subPerm)
      }
      return p
   }
   
   // 1, 2, 6, 24, 120
   func getCountPerms(_ s: String) -> Int {
      if s.count < 3 { return s.count }
      return s.count * (getCountPerms(String(s.dropFirst())))
   }
   
   // given an infinite number of quarters, dimes, nickels and pennies
   // return the number of ways to represent n cents
   func change(_ amount: Int, _ coins: [Int]) -> Int {
      
      guard amount > 0 else { return 1 }
      
      var dp = Array(repeating: 0, count: amount + 1)
      dp[0] = 1
      for coin in coins {
         for currentAmount in 1...amount {
            if currentAmount >= coin {
               dp[currentAmount] += dp[currentAmount - coin]
            }
         }
      }
      return dp[amount]
   }
   
   func changeRecursive(_ amount: Int, _ coins: [Int], _ currentCoinIndex: Int) -> Int {
      if amount == 0 {
         return 1
      }
      if amount < 0 {
         return 0
      }
      var combinations = 0
      //for coin in coins {
      for coinIndex in currentCoinIndex ..< coins.count {
         let coin = coins[coinIndex]
         combinations += changeRecursive(amount - coin, coins, coinIndex)
      }
      return combinations
   }
   
   func changeRecursive2(_ amount: Int, _ coins: [Int]) -> Int {
      let coinsSorted = coins.sorted()
      var memo = [String: Int]()
      return self.cr2r(amount, coinsSorted, coinsSorted.count - 1, &memo)
   }
   
   func cr2r(_ amount: Int, _ coins: [Int], _ coinIndex: Int, _ memo: inout [String: Int]) -> Int {
      let memoKey = "\(amount):\(coinIndex)"
      if let cached = memo[memoKey] {
         return cached
      }
      if amount == 0 {
         return 1
      }
      if amount < 0 {
         return 0
      }
      var answer = 0
      let coin = coins[coinIndex]
    
      // current coin is greater than amount, skip over it and go to the next smaller coin
      if coin > amount {
         answer = cr2r(amount, coins, coinIndex - 1, &memo)
      }
      // there are more coins to consider, test the next coin, plus the number of solutions using the current coin
      else if coinIndex > 0 {
         answer = cr2r(amount, coins, coinIndex - 1, &memo) + cr2r(amount - coin, coins, coinIndex, &memo)
      }
      // no more coins, just calculate the answer from the current coin (will either return 1 or 0)
      else {
         answer = cr2r(amount - coin, coins, coinIndex, &memo)
      }
      memo["\(amount):\(coinIndex)"] = answer
      return answer
   }
   
   
//   Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.
//
//   Example 1:
//
//   Input: [2,3,-2,4]
//   Output: 6
//   Explanation: [2,3] has the largest product 6.
   func maxProduct(_ nums: [Int]) -> Int {
      guard nums.count > 0 else { return 0 }
      var cMax = nums[0]
      var iMin = cMax
      var iMax = cMax
      
      for i in 1 ..< nums.count {
         let current = nums[i]
         let lastiMax = iMax
         iMax = max(current, current * iMin, current * iMax)
         iMin = min(current, current * iMin, current * lastiMax)
         cMax = max(cMax, iMax)
      }
      return cMax
   }
}
