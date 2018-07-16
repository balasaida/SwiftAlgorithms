//
//  QueueTests.swift
//  SwiftAlgorithmsTests
//
//  Created by Burri on 2018-05-17.
//  Copyright © 2018 Burri. All rights reserved.
//

import XCTest

@testable import SwiftAlgorithms

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testQueue() {
        var queue = Queue<Int>()
        queue.enqueue(newItem: 1)
        queue.enqueue(newItem: 2)
        queue.enqueue(newItem: 3)
        queue.enqueue(newItem: 4)
        queue.enqueue(newItem: 5)
        queue.enqueue(newItem: 6)
        queue.enqueue(newItem: 7)
        queue.enqueue(newItem: 8)
        
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        print(queue.efficientDeque())
        
        print(queue)
    }
    
    func testLinkedList() {
        var list = LinkedList<String>()
        list.append(value: "Hello")
        list.append(value: "world")
        
        print(list.isEmpty)
        print(list.count)
        
        list.remove(at: 0)
        print(list.count)
        
        print(list.head?.value)
        
        list.append(value: "new")
        print(list.count)
        print(list.last)
        
        
    }
}
