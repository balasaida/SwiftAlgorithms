//
//  LinkedList.swift
//  SwiftAlgorithms
//
//  Created by Media Floater on 2018-07-13.
//  Copyright © 2018 Burri. All rights reserved.
//

import Foundation

public final class LinkedListNode<Element> {
    
    var value: Element
    var next: LinkedListNode?
    var prev: LinkedListNode?
    
    init(value: Element) {
        self.value = value
    }
}

public struct LinkedList<Element> {
    
    public typealias Node = LinkedListNode<Element>
    private(set) var head: Node?
        
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        
        while let nextNode = node.next {
            node = nextNode
        }
        return node
    }
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var count: Int {
        guard !isEmpty, var node = head else { return 0 }
        
        var count = 1
        while let nextNode = node.next {
            node = nextNode
            count += 1
        }
        
        return count
    }
    
    public mutating func append(value: Element) {
        let node = Node(value: value)
        append(node)
    }
    
    public mutating func append(_ node: Node) {
        let newNode = node
        if let lastNode = last {
            newNode.prev = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    public subscript(at index: Int) -> Element? {
        guard let value = self.node(at: index)?.value else {
            return nil
        }
        return value
    }
    
    public func node(at index: Int) -> Node? {
        guard var node = head, index >= 0, index <= count else { return nil }
        
        if index == 0 {
            return head
        } else if index == count {
            return last
        } else {
            for _ in 1..<index {
                if let nextNode = node.next {
                    node = nextNode
                } else { break }
            }
        }
        return node
    }
    
    public mutating func removeAll() {
        head = nil
    }
    
    @discardableResult public mutating func remove(node: Node) -> Element {
        let nextNode = node.next
        let prevNode = node.prev
        
        if let previousNode = prevNode {
            nextNode?.prev = previousNode
        } else {
            head = nextNode
        }
        
        prevNode?.next = nextNode
        
        node.prev = nil
        node.next = nil
        
        return node.value
    }
    
    @discardableResult public mutating func remove(at Index: Int) -> Element? {
        guard let node = self.node(at: Index) else { return nil }
        
        return remove(node: node)
    }
}

// MARK: - Collection
extension LinkedList: Collection {
    
    public typealias Index = LinkedListIndex<Element>
    
    public var startIndex: Index {
        get {
            return LinkedListIndex<Element>(node: head, tag: 0)
        }
    }
    
    public var endIndex: Index {
        get {
            if let h = self.head {
                return LinkedListIndex<Element>(node: h, tag: count)
            } else {
                return LinkedListIndex<Element>(node: nil, tag: startIndex.tag)
            }
        }
    }
    
    public subscript(position: Index) -> Element {
        get {
            return position.node!.value
        }
    }
    
    public func index(after idx: Index) -> Index {
        return LinkedListIndex<Element>(node: idx.node?.next, tag: idx.tag + 1)
    }
}

public struct LinkedListIndex<Element>: Comparable {
    
    fileprivate let node: LinkedListNode<Element>?
    fileprivate let tag: Int
    
    public static func < (lhs: LinkedListIndex<Element>, rhs: LinkedListIndex<Element>) -> Bool {
        return (lhs.tag < rhs.tag)
    }
    
    public static func == (lhs: LinkedListIndex<Element>, rhs: LinkedListIndex<Element>) -> Bool {
        return lhs.tag == rhs.tag
    }
}
