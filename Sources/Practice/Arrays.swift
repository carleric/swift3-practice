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
}
