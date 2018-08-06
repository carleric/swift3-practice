//
//  List.swift
//  Swift3PracticePackageDescription
//
//  Created by Carl Bolstad on 5/3/18.
//

import Foundation

class List<T> {
    var value: T
    var next: List<T>?
    
    convenience init?(_ values: T...) {
        self.init(Array(values))
    }
    
    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        next = List(Array(values.suffix(from: 1)))
    }
    
    func append(_ value: T) {
        
    }
}

extension List {
    var last: T? {
        var _next = self.next
        while _next?.next != nil {
            _next = _next?.next
        }
        return _next?.value
    }
}

extension List {
    var pennultimate: T? {
        return self.kthLast(k: 1)
    }
}

extension List {
    func kthLast(k: Int) -> T? {
        var runnerIndex = k
        
        //runner advance k
        var runner: List<T>? = self
        while runnerIndex >= 0 {
            runnerIndex -= 1
            runner = runner?.next
        }
        
        //save initial value to follower
        var follower: List<T>? = self
        
        //run both follower and runner to end
        while runner != nil {
            follower = follower?.next
            runner = runner?.next
        }
        
        return follower?.value
    }
}

extension List {
    subscript(index: Int) -> T? {
        var currentIndex = 0
        var current: List<T>? = self
        while currentIndex < index {
            currentIndex += 1
            current = current?.next
        }
        return current?.value
    }
}

extension List {
    var length: Int {
        var l = 0
        var current: List<T>? = self
        while current != nil {
            l += 1
            current = current?.next
        }
        return l
    }
}

extension List {
    func reverse() -> List<T> {
        
        var current: List<T>? = self
        var next: List<T>?
        var last: List<T>?
        
        //walk to end
        while current != nil {
            //save next
            next = current?.next
            
            //point current to last
            current?.next = last
            
            //save current as last
            last = current
            
            //move ahead
            current = next
        }
        
        return last!
    }
}
