class Reducer {

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

	 func getUniqueFromArray2(array: [Int]) -> [Int] {
	 	var seen: [Int:Bool] = [:]

	 	return array.filter{ seen.updateValue(true, forKey:$0) ==  nil }
	 }
}