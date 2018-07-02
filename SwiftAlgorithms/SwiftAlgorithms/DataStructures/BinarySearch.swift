//
//  BinarySearch.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-24.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

extension Array where Element: Comparable {
    
    func binarySearch(key: Element) -> Index? {
        guard !self.isEmpty else {
            return nil
        }
        var lowerIndex = 0
        var upperIndex = self.count
        
        while  lowerIndex < upperIndex {
            let midIndex = index(lowerIndex, offsetBy: distance(from: lowerIndex, to: upperIndex)/2)
            if self[midIndex] == key {
                return midIndex
            } else if self[midIndex] > key {
                lowerIndex = index(after: midIndex)
            } else {
                upperIndex = midIndex
            }
        }
        
        return nil
    }
}

