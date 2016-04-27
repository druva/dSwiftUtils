//
//  IntExtension.swift
//  dSwiftUtils
//
//  Created by DRUVAKANTH YARLAGADDA on 4/21/16.
//
//

import UIKit

extension Int {
    /**
     Generates Random Number from the given range
     
     - parameter min: default value 0
     - parameter max: provide integer
     
     - returns: Integer between given range
     */
    public static func random(min min: Int = 0, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    /**
     Checks if given number is Even or not
     
     - returns: returns true of false
     */
    public var isEven: Bool {
        return (self % 2) == 0
    }
    
    /**
     Checks if given number is Odd or not
     
     - returns: returns true of false
     */
    public var isOdd: Bool {
        return (self % 2) == 1
    }
}
