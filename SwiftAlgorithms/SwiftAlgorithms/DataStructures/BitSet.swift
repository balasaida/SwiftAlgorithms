//
//  BitSet.swift
//  SwiftAlgorithms
//
//  Created by Burri on 2018-05-21.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

struct BitSet {
    
    private(set) var size: Int
    let N = 64
    typealias Word = UInt64
    fileprivate(set) var words: [Word]
    
    init(size: Int) {
        precondition(size > 0)
        self.size = size
        let n = (size + N) / N
        words = [Word](repeatElement(0, count: n))
    }
    
    private func index(of i: Int) -> (Int, Word){
        precondition(i >= 0)
        precondition(i < size)
        let o = i/N
        let m = Word(i-o*N)
        
        return (o, 1 << m)
    }
    
    private mutating func set(at i: Int) {
        let (index, word) = self.index(of: i)
        words[index] |= word
    }
    
    private mutating func clear(at i: Int) {
        let (index, word) = self.index(of: i)
        words[index] &= ~word
    }
}
