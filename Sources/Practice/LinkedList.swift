//
//  LinkedList.swift
//  Swift3PracticePackageDescription
//
//  Created by Carl Bolstad on 7/28/18.
//

class LinkedListNode <T> {
   var value: T?
   var next: LinkedListNode?
   
   init(_ val: T) {
      self.value = val
   }
}

class LinkedList <T> {
   public typealias Node = LinkedListNode<T>
   
   private var head: Node?
   
   public var isEmpty: Bool {
      return head == nil
   }
   
   public var first: Node? {
      return head
   }
   
   public var last: Node? {
      guard var node = head else {
         return nil
      }
      while let next = node.next {
         node = next
      }
      return node
   }
   
   public func append(_ val: T) {
      let newNode = LinkedListNode(val)
      if let tail = self.last {
         tail.next = newNode
      } else {
         self.head = newNode
      }
   }
   
   public var count: Int {
      if isEmpty { return 0 }
      var c = 1
      var node = head
      while let next = node?.next {
         c += 1
         node = next
      }
      return c
   }
   
   public func node(atIndex index: Int) -> Node? {
      var node = head
      for _ in 0..<index {
         node = node?.next
         if node == nil {
            break
         }
      }
      return node
   }
   
   public func reverse() {
      var node = head
      var last: Node? = nil
      
      while node != nil {
         //get next
         let next = node?.next
         
         //reverse pointer
         node?.next = last
         
         //set last to current for the next iteration
         last = node
         
         //set current to next (advance)
         node = next
      }
      self.head = last
   }
}
