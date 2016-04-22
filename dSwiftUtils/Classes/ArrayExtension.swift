//
//  ArrayExtension.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/21/16.
//
//

import UIKit

extension Array {
    /**
     Suffles Array and updates self
     */
    public mutating func shuffle() {
        for var i = self.count - 1; i >= 1; i-- {
            let j = Int(arc4random_uniform(UInt32((i - 1) + 1)))
            swap(&self[i], &self[j])
        }
    }
}
