//
//  FixedSizeArray.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-22.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct FixedSizeArray<T> {
    
    private var maxSize: Int
    private var array: [T]
    private var count: Int = 0
    private var defaultValue: T
    
    init(maxSize: Int, value: T) {
        self.maxSize = maxSize
        defaultValue = value
        self.array = [T](repeating: value, count: maxSize)
    }
    
    mutating func append(newItem: T) {
        precondition(count < maxSize)
        array[count] = newItem
        count +=  1
    }
    
    mutating func removeItem(at index: Int) -> T {
        precondition(index >= 0)
        precondition(index < count)
        
        count -= 1
        let item = array[index]
        array[index] = array[count]
        array[count] = defaultValue

        return item
    }
    
    subscript(index: Int) -> T {
        precondition(index >= 0)
        precondition(index < count)
        return array[index]
    }
    
    mutating func removeAll() {
        for index in 0..<count {
            array[index] = defaultValue
        }
        count = 0
    }
}
