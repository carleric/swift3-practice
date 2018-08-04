//
//  LinkedList.swift
//  Swift3PracticePackageDescription
//
//  Created by Carl Bolstad on 7/28/18.
//

public class ListNode {
   public var val: Int
   public var next: ListNode?
   public init(_ val: Int) {
      self.val = val
      self.next = nil
   }
   
   func append(_ val: Int) {
      var end: ListNode? = self
      while end?.next != nil {
         end = end?.next
      }
      end?.next = ListNode(val)
   }
   
   func values() -> [Int] {
      var vals = [Int]()
      var current: ListNode? = self
      while current != nil {
         vals.append(current!.val)
         current = current!.next
      }
      return vals
   }
   
   func remove() {
      if let next = self.next {
         self.val = next.val
         self.next = next.next
      } else {
         // how to delete self if this is the last item in list?
      }
   }
}

class LinkedList_LeetCode {
   
   func makeList(_ values: [Int]) -> ListNode? {
      guard let first = values.first else { return nil }
      let head = ListNode(first)
      for i in 1..<values.count {
         let val = values[i]
         head.append(val)
      }
      return head
   }
   
   func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
      var runner = head
      var nth = head
      var i = 0
      while runner != nil {
         
         if i > n {
            nth = nth?.next
         }
         
         i += 1
         runner = runner?.next
      }
      //nth?.remove()
      if let nthplus1 = nth?.next {
         nth?.val = nthplus1.val
         nth?.next = nthplus1.next
      } else {
         nth = nil
      }
      return head
   }
}
