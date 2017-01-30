import Foundation

class BinaryTreeNode {
	var data: Int = 0 
	var left: BinaryTreeNode?
	var right: BinaryTreeNode?

	init(_ data: Int) {
		self.data = data
	}
}

protocol Tree {
	var height: Int { get }
	var count: Int { get }

	func insertValue(_: Int)
	func preOrderVisit() -> [Int]
}

class BinaryTree: Tree {
	var height: Int = 0
	var count: Int = 0
	var root: BinaryTreeNode?

	func insertValue(_ value: Int) {
		self.root = self.insert(value, at: self.root)
		self.count += 1
	}

	func insert(_ value: Int, at node: BinaryTreeNode?) -> BinaryTreeNode? {
		if(node == nil) {
			return BinaryTreeNode(value)
		}
		else if (value < node!.data) {
			node!.left = self.insert(value, at: node!.left)
		}
		else if (value > node!.data) {
			node!.right = self.insert(value, at: node!.right)
		}
		else {
			self.count -= 1 //duplicate
		}
		return node
	}

	func preOrderVisit() -> [Int] {
		var ordered = [Int]()
		self.preOrder(self.root, ordered:&ordered)
		return ordered
	}

	func preOrder(_ node: BinaryTreeNode?, ordered: inout [Int]) {
		if let current = node {
			print("\(current.data)")
			ordered.append(current.data)
			preOrder(current.left, ordered:&ordered)
			preOrder(current.right, ordered:&ordered)
		}
	}
}
