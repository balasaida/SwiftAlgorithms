//
//  Sort.swift
//  SwiftAlgorithms
//
//  Created by Media Floater on 2018-07-24.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    mutating func applyInsertionSort() -> [Element] {
        for i in 1..<self.count {
            var tempIndex = i
            let item = self[tempIndex]
            while tempIndex > 0 && item < self[index(before: tempIndex)] {
                self[tempIndex] = self[index(before: tempIndex)]
                tempIndex = index(before: tempIndex)
            }
            self[tempIndex] = item
        }
        return self
    }
    
    mutating func applySelectionSort() -> [Element] {
        for itemIndex in 0..<self.count-1 {
            var tempIndex = itemIndex
            for lowestNumberIndx in (itemIndex + 1)..<self.count {
                if self[lowestNumberIndx] < self[tempIndex] {
                    tempIndex = lowestNumberIndx
                }
                
            }
            swapAt(itemIndex, tempIndex)
        }
        return self
    }
}
