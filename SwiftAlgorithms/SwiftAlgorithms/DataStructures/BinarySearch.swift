//
//  BinarySearch.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-24.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct BinarySearch<T> {
    
    func binarySearch<T: Comparable>(array: [T], key: T) -> Int? {
        var lowerBound = 0
        var upperBound = array.count
        
        while lowerBound < upperBound {
            let midBound = (lowerBound + upperBound) / 2
            if array[midBound] == key {
                return midBound
            }
            if array[midBound] < key {
                lowerBound = midBound + 1
            } else {
                upperBound = midBound
            }
        }
        return 0
    }
}

