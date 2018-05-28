//
//  Queue.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-15.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct Queue<T> {
    
    fileprivate var items: [T?] = []
    fileprivate var head: Int = 0
    
    var isEmpty: Bool {
        return items.isEmpty
    }
    
    var first: T? {
        return !isEmpty ? items[head] : nil
    }
    
    mutating func enqueue(newItem: T) {
        items.append(newItem)
    }
    
    mutating func dequeue() -> T? {
        return items.popLast() ?? nil
    }
    
    mutating func efficientDeque() -> T? {
        guard head < items.count, let item = items[head] else { return nil }
        items[head] = nil
        head += 1
        
        let percentage = Double(head)/Double(items.count)
        if items.count > 5 && percentage > 0.25 {
            items.removeFirst(head)
            head = 0
        }
        
        return item
    }
}
