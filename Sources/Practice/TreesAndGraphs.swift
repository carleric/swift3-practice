

import Foundation

public class TreeNode {
   public var val: Int
   public var left: TreeNode?
   public var right: TreeNode?

   public init(_ val: Int) {
      self.val = val
      self.left = nil
      self.right = nil
  }
}

public class TreesAndGraphs {
   func inorderTraversal(_ root: TreeNode?) -> [Int] {
      var traversed = [Int]()
      inorderTraverse(root, &traversed)
      return traversed
   }
   
   func inorderTraverse(_ node: TreeNode?, _ traversed: inout [Int]) {
      guard let node = node else { return }
      inorderTraverse(node.left, &traversed)
      traversed.append(node.val)
      inorderTraverse(node.right, &traversed)
   }
   
   func inorderTraversal2(_ root: TreeNode?) -> [Int] {
      var current = root
      var nodeStack = [TreeNode]()
      var traversed = [Int]()
      while current != nil {
         if current!.left != nil && !traversed.contains(current!.left!.val){
            nodeStack.append(current!)
            current = current!.left
            continue
         } else {
            traversed.append(current!.val)
         }
         if current!.right != nil {
            current = current!.right
         } else if nodeStack.count > 0 {
            current = nodeStack.removeLast()
         } else {
            current = nil
         }
      }
      return traversed
   }
   
   func numIslands(_ grid: [[Character]]) -> Int {
      var g = grid
      var numIslands = 0
      for row in 0 ..< grid.count {
         for col in 0 ..< grid[0].count {
            numIslands += sink(row: row, col: col, grid: &g)
         }
      }
      return numIslands
   }
   
   func sink(row: Int, col: Int, grid: inout [[Character]]) -> Int {
      if row < 0 || col < 0 || row > grid.count - 1 || col > grid[0].count - 1 || grid[row][col] == "0" {
         return 0
      }
      grid[row][col] = "0"
      let directions = [0, 1, 0, -1, 0]
      for i in 0 ..< 4 {
         _ = sink(row: row + directions[i], col: col + directions[i+1], grid: &grid)
      }
      return 1
   }
   
   func generateParenthesis(_ n: Int) -> [String] {
      var parens = [String]()
      generateParens(n, n, &parens, "")
      return parens
   }
   
   func generateParens(_ left: Int, _ right: Int, _ parens: inout [String], _ s: String) {
      if right < left { return }
      if left == 0 && right == 0 {
         parens.append(s)
         return
      }
      if right > 0 {
         generateParens(left, right - 1, &parens, s + ")")
      }
      if left > 0 {
         generateParens(left - 1, right, &parens, s + "(")
      }
   }
}
