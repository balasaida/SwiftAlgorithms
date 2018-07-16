//
//  Stack.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-15.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct Stack<Element> {
    
    fileprivate var items: [Element] = []
    
    mutating func push(newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        return items.popLast()
    }
    
    var peek: Element? {
        return items.last
    }
}
