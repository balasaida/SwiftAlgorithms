//
//  Stack.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-15.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct Stack<T> {
    
    fileprivate var items: [T] = []
    
    mutating func push(newItem: T) {
        items.append(newItem)
    }
    
    mutating func pop() -> T? {
        return items.popLast()
    }
    
    var peek: T? {
        return items.last
    }
}
