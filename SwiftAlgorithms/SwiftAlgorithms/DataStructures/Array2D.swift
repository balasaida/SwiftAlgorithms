//
//  Array2D.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-18.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct Array2D {
    
    var array = [[Int]]()
    
    mutating func create2DArray() {
        [1, 2, 3, 4, 5, 6, 7, 8, 9].forEach { _ in
            var row = [Int]()
            [1, 2, 3, 4, 5, 6, 7].forEach { number in
                row.append(number)
            }
            array.append(row)
        }
    }
}

struct TwoDimArray<T> {
    
    func dim(count: Int, value: T) -> [[T]] {
        return [[T]](repeatElement([T](repeatElement(value, count: count)), count: count))
    }
}

struct GenericArray2D<T> {
    
    var rows: Int
    var columns: Int
    var array: [T]
    
    init(rows: Int, columns: Int, initialValue: T) {
        self.rows = rows
        self.columns = columns
        array = Array.init(repeating: initialValue, count: rows*columns)
    }
    
    subscript(row: Int, column: Int) -> T {
        get {
           return array[row*columns + column]
        }
        
        set {
            array[row*columns + column] = newValue
        }
    }
}
