//
//  ArrayUtils.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/21/16.
//
//

import UIKit

extension Array {
    public mutating func shuffle() {
        for var i = self.count - 1; i >= 1; i-- {
            let j = Int(arc4random_uniform(UInt32((i - 1) + 1)))
            swap(&self[i], &self[j])
        }
    }
    
    public var shuffled: [Element] {
        var array = self
        array.shuffle()
        return array
    }
    
    public func map<T>(@noescape trans: Element -> T?) -> [T] {
        var mapped = [T]()
        forEach { (ele) -> () in
            if let e = trans(ele) {
                mapped.append(e)
            }
        }
        return mapped
    }
}
