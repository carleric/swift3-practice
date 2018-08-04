import Foundation

class Arrays {

	//Input - [2,3,4,4,4,5,6,6,6,6,7,7,8,9]
	//Output - [2,3,4,5,6,7,8,9]

	//My first try
	func getUniqueFromArray(array: [Int]) -> [Int] {
		var out: [Int] = [Int]()
		var outDict: [Int: Bool] = [Int: Bool]()

		for value in array {
			if(outDict[value] == nil) {
				outDict[value] = true
			 	out.append(value)
			}
		}

		return out
	 }

	 //Better
	func getUniqueFromArray2(array: [Int]) -> [Int] {
		var out: [Int] = [Int]()

		for value in array {
			if(out.contains(value) == false) {
				out.append(value)
			}
		}

		return out
	 }

	 //Best
	 func getUniqueFromArray3(array: [Int]) -> [Int] {
	 	var seen: [Int:Bool] = [:]

	 	return array.filter{ seen.updateValue(true, forKey:$0) ==  nil }
	 }

	 //zeros 1
	 func zeroOut1(matrix: inout [[Int]]) {

	 	var colIndexesWithZero = [Int]()

		for i in 0..<matrix.count {
			let row = matrix[i]
			for j in 0..<row.count {
				if(row[j] == 0) {
					colIndexesWithZero.append(j)
					//zero out the row
					for k in 0..<row.count {
						matrix[i][k] = 0
					}
					//leave row inner loop
					break
				}
				else if(colIndexesWithZero.contains(j)) {
					matrix[i][j] = 0
				}
			}
		}
	 }

	 //zeros 2
	 func zeroOut2(matrix: inout [[Int]]) {
	 	var rowIndexesWithZero = [Int]()
	 	var colIndexesWithZero = [Int]()

	 	for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				if matrix[i][j] == 0 {
					rowIndexesWithZero.append(i)
					colIndexesWithZero.append(j)
				}
			}
		}

		for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				if rowIndexesWithZero.contains(i) || colIndexesWithZero.contains(j) {
					matrix[i][j] = 0
				}
			}
		}
	 }

	 //zeros 3
	 func zeroOut3(matrix: inout [[Int]]) {
	 	var rowIndexesWithZero = [Int]()
	 	var colIndexesWithZero = [Int]()

	 	for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				if matrix[i][j] == 0 {
					rowIndexesWithZero.append(i)
					colIndexesWithZero.append(j)
				}
			}
		}

		for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				if rowIndexesWithZero.contains(i) && colIndexesWithZero.contains(j) {
					//matrix[i][j] = 0
				}
				else if rowIndexesWithZero.contains(i) || colIndexesWithZero.contains(j) {
					matrix[i][j] = 0
				}
			}
		}
	 }

	 //zeros 4
	 func zeroOut4(matrix: inout [[Int]]) {
	 	var rowIndexesWithZero = [Int]()
	 	var colIndexesWithZero = [Int]()

	 	for i in 0..<matrix.count {
			for j in 0..<matrix[i].count {
				if matrix[i][j] == 0 {
					rowIndexesWithZero.append(i)
					colIndexesWithZero.append(j)
				}
			}
		}

		for rowIndex in rowIndexesWithZero {
			for i in 0..<matrix[rowIndex].count {
				matrix[rowIndex][i] = 0
			}
		}

		for colIndex in colIndexesWithZero {
			for i in 0..<matrix.count {
				matrix[i][colIndex] = 0
			}
		}
	 }

	 func walkMatrixClockwise(_ matrix: inout Array<Array<Int>>) -> Array<Int>
	 {
       var outArray = [Int]()
	    var operationIndex = 0
	    var hasMore = true
	    while (hasMore)
	    {
	        switch (operationIndex)
	        {
	        case 0:
	            hasMore = walkRowRight(&matrix, &outArray)
	            operationIndex = operationIndex + 1
	            break
	        case 1:
	            hasMore = walkColDown(&matrix, &outArray)
	            operationIndex = operationIndex + 1
	            break
	        case 2:
	            hasMore = walkRowLeft(&matrix, &outArray)
	            operationIndex = operationIndex + 1
	            break
	        case 3:
	            hasMore = walkColUp(&matrix, &outArray)
	            operationIndex = 0
	            break
	        default:
	            break
	        }
	    }
			return outArray
	}

	func walkRowRight(_ matrix: inout Array<Array<Int>>, _ outArray: inout Array<Int>) -> Bool
	{
	    if (matrix.count > 0)
	    {
	        //print("walking right through \(matrix.count) columns")
	        for item in matrix[0]
	        {
	            print(item)
               outArray.append(item)
	        }
	        matrix.remove(at: 0)
	        return true
	    } else {
	        return false
	    }
	}

	func walkRowLeft(_ matrix: inout Array<Array<Int>>, _ outArray: inout Array<Int>) -> Bool
	{
	    if (matrix.count > 0)
	    {
	        //print("walking left through \(matrix[matrix.count-1].count) columns")
	        for index in stride(from: matrix[matrix.count - 1].count-1, through:0, by:-1)
	        {
	            let item = matrix[matrix.count - 1][index]
	            print(item)
               outArray.append(item)
	        }
	        matrix.remove(at: matrix.count - 1)
	        return true
	    } else {
	        return false
	    }
	}

	func walkColDown(_ matrix: inout Array<Array<Int>>, _ outArray: inout Array<Int>) -> Bool
	{
	    if (matrix.count > 0 && matrix[0].count > 0)
	    {
	        //print("walking down through \(matrix.count) rows")
	        for index in 0..<matrix.count
	        {
	            var row = matrix[index]
               let item = row[row.count - 1]
	            print(item)
               outArray.append(item)
	            row.remove(at: row.count - 1)
	            matrix[index] = row
	        }
	        return true
	    } else {
	        return false
	    }
	}

	func walkColUp(_ matrix: inout Array<Array<Int>>, _ outArray: inout Array<Int>) -> Bool
	{
	    if (matrix.count > 0 && matrix[0].count > 0)
	    {
	        //print("walking up through \(matrix.count) rows")
	        for index in stride(from: matrix.count - 1, through: 0, by: -1)
	        {
	            var row = matrix[index]
               let item = row[0]
	            print(item)
               outArray.append(item)
	            row.remove(at: 0)
	            matrix[index] = row
	        }

	        return true
	    } else {
	        return false
	    }
	}
   
   //2nd try
   func walkMatrixClockwise2(_ matrix: [[Int]]) -> [Int]
   {
      var newMatrix = matrix
      var outArray = [Int]()
      while !newMatrix.isEmpty
      {
         outArray += newMatrix.removeFirst()
         newMatrix = transposeMatrix(newMatrix)
      }
      return outArray
   }
   
   func transposeMatrix(_ matrix: [[Int]]) -> [[Int]]
   {
      let numRows = matrix.count
      var newMatrix = [[Int]]()
      
      if let numCols = matrix.first?.count
      {
         for colIndex in stride(from: numCols-1, through: 0, by: -1)
         {
            var newRow = [Int]()
            for rowIndex in 0..<numRows
            {
               newRow.append(matrix[rowIndex][colIndex])
            }
            newMatrix.append(newRow)
         }
      }
      return newMatrix
   }
   
   // Following questions are from //https://leetcode.com/explore/interview/card/top-interview-questions-easy
   
   // Given a sorted array nums, remove the duplicates in-place such that each element appear only once and return the new length.
   // Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
   func removeDuplicates(_ input: inout [Int]) -> Int {
      var seen = [Int: Int]()
      for element in input {
         let head = input.removeFirst()
         if seen[element] == nil {
            input.append(head)
         }
         seen[element] = 1
      }
      return input.count
   }
   
   // Say you have an array for which the ith element is the price of a given stock on day i.
   // Design an algorithm to find the maximum profit. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
   // example: Input: [7,1,5,3,6,4]
   func maxProfit(_ prices: [Int]) -> Int {
      
      var indexBoughtAt: Int = -1
      var profit = 0
      
      for i in 0..<prices.count {
         // examine pairs:
         if i < prices.count - 1 {
            // if increasing: buy (if not bought)
            if prices[i] <= prices[i+1] && indexBoughtAt == -1 {
               indexBoughtAt = i
            }
            // if decreasing: sell,
            else if prices[i] > prices[i+1] && indexBoughtAt != -1 {
               profit += prices[i] - prices[indexBoughtAt]
               indexBoughtAt = -1
            }
         } else {
            // last item, sell if not sold already
            if indexBoughtAt != -1 {
               profit += prices[i] - prices[indexBoughtAt]
            }
         }
      }
      return profit
   }
   
   func rotate(_ nums: inout [Int], _ k: Int) {
      if nums.count == 0 || k == 0 { return }
      for _ in 1...k {
         nums.insert(nums.popLast()!, at:0)
      }
   }
   
   func containsDuplicate(_ nums: [Int]) -> Bool {
      var seen: Set<Int> = []
      for element in nums {
         if seen.contains(element) { return true }
         seen.insert(element)
      }
      return false
   }
   
   func singleNumber(_ nums: [Int]) -> Int {
      var one: Set<Int> = []
      var more: Set<Int> = []
      
      for num in nums {
         if one.contains(num) {
            one.remove(num)
            more.insert(num)
         } else if !more.contains(num) {
            one.insert(num)
         }
      }
      return one.count == 1 ? one.first! : -1
   }
   
   // Given two arrays, write a function to compute their intersection.
   // Example:
   // Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
   func intersect1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      var result = [Int]()
      if nums1.count == 0 || nums2.count == 0 { return result }
      
      let nums1sorted = nums1.sorted()
      let nums2sorted = nums2.sorted()
      let minNums = min(nums1sorted.first!, nums2sorted.first!)
      let maxNums = max(nums1sorted.last!, nums2sorted.last!)
      
      for i in minNums...maxNums {
         
         result.append(i)
      }
      return result
   }
   
   func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
      let num1Counts = arrayCounts(nums1)
      let num2Counts = arrayCounts(nums2)
      let allNums = Set(num1Counts.keys).intersection(Set(num2Counts.keys))
      var result = [Int]()
      
      for num in allNums {
         let countOfNum = min(num1Counts[num] ?? 0, num2Counts[num] ?? 0)
         for _ in 0..<countOfNum {
            result.append(num)
         }
      }
      return result.sorted()
   }
   
   func arrayCounts(_ nums: [Int]) -> [Int: Int] {
      var counts = [Int: Int]()
      for num in nums {
         let count = counts[num] ?? 0
         counts[num] = count + 1
      }
      return counts
   }
   
   func plusOne(_ digits: [Int]) -> [Int] {
      var result = [Int]()
      var remainder = 1
      for digit in digits.reversed() {
         var sum = 0
         if digit + remainder > 9 {
            sum = 0
            remainder = 1
         } else {
            sum = digit + remainder
            remainder = 0
         }
         result.insert(sum, at: 0)
      }
      if remainder == 1 { result.insert(remainder, at: 0)}
      return result
   }
   
   func moveZeroes(_ nums: inout [Int]) {
      if nums.count == 0 { return }
      var i = nums.count - 1
      
      for _ in 0..<nums.count {
         let current = nums[i]
         if current != 0 {
            nums.remove(at: i)
            nums.insert(current, at: 0)
         } else {
            i -= 1
         }
      }
   }
   
   func moveZeroes2(_ nums: inout [Int]) {
      var numZeroes = 0
      var position = 0
      for num in nums {
         if num == 0 {
            nums.remove(at: position)
            numZeroes += 1
         } else {
            position += 1
         }
      }
      for _ in 0..<numZeroes {
         nums.append(0)
      }
   }
   
   // Given an array of integers, return indices of the two numbers such that they add up to a specific target.
   // You may assume that each input would have exactly one solution, and you may not use the same element twice.
   // Example:
   // Given nums = [2, 7, 11, 15], target = 9,
   // Because nums[0] + nums[1] = 2 + 7 = 9,
   // return [0, 1].
   func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
      for i in 0..<nums.count {
         for j in i+1..<nums.count {
            if nums[i] + nums[j] == target {
               return [i, j]
            }
         }
      }
      return []
   }
   
   // Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
   // Each row must contain the digits 1-9 without repetition.
   // Each column must contain the digits 1-9 without repetition.
   // Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
   func isValidSudoku(_ board: [[Character]]) -> Bool {
      for row in board {
         if !isValidSodokuSet(row) { return false }
      }
      for col in rotate(board) {
         if !isValidSodokuSet(col) { return false }
      }
      for section in splitMatrixIntoSubs(board) {
         print("testing \(section)")
         if !isValidSodokuSet(section) { return false }
      }
      return true
   }
   
   func isValidSodokuSet(_ set: [Character]) -> Bool {
      var charCounts: [Character: Int] = ["1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0]
      if set.count != 9 { return false }
      for ch in set {
         if ch != "." {
            let chCount = charCounts[ch]
            if chCount == nil || chCount == 1 {
               return false
            } else {
               charCounts[ch] = 1
            }
         }
      }
      return true
   }
   
   func rotate<T>(_ matrix: [[T]]) -> [[T]]
   {
      let numRows = matrix.count
      var newMatrix = [[T]]()
      
      if let numCols = matrix.first?.count
      {
         for colIndex in stride(from: numCols-1, through: 0, by: -1)
         {
            var newRow = [T]()
            for rowIndex in 0..<numRows
            {
               newRow.append(matrix[rowIndex][colIndex])
            }
            newMatrix.append(newRow)
         }
      }
      return newMatrix
   }
   
   func splitMatrixIntoSubs<T>(_ board: [[T]]) -> [[T]]
   {
      var newMatrix = [[T]]()
      let length1d = board.first!.count
      let countSubsPerDimension = Int(sqrt(Double(length1d)))
      
      for outerRow in stride(from: 0, to: length1d, by: countSubsPerDimension) {
         for outerCol in stride(from: 0, to: length1d, by: countSubsPerDimension)  {
            
            var arr = [T]()
            for innerRow in 0..<countSubsPerDimension {
               for innerCol in 0..<countSubsPerDimension {
                  arr.append(board[outerRow+innerRow][outerCol+innerCol])
               }
            }
            newMatrix.append(arr)
            
         }
      }
      return newMatrix
   }
   
   func rotate<T>(_ matrix: inout [[T]]) {
      //transpose (swap 0,1 with 1,0...0,4 with 4,0)
      var i = 0
      var j = 0
      while i < matrix.count {
         while j < matrix.count {
            let temp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = temp
            j += 1
         }
         i += 1
         j = i
      }
      //reverse each row
      for i in 0..<matrix.count {
         matrix[i].reverse()
      }
   }
}
