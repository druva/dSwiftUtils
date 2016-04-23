//
//  StringExtension.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/21/16.
//
//

import Foundation

extension String {
    
    /**
     Description
     
     - parameter len: length of the string
     - parameter charset: charset
     
     - returns: returns string
     */
    public static func random(var length len: Int = 0, charset: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") -> String {
        if len < 1 {
            len = Int.random(max: 16)
        }
        var result = String()
        let max = charset.length() - 1
        for _ in 0 ..< len {
            result += String(charset[Int.random(min: 0, max: max)])
        }
        return result
    }
    
    /**
     Returns lenght of the string
     
     - returns: Returns lenght of the string
     */
    public func length()-> Int {
        return self.characters.count
    }
    
    /**
     Description
     
     - parameter index: index description
     
     - returns: return value description
     */
    public subscript(index: Int) -> String? {
        let range = startIndex.advancedBy(index)
        if let char: Character = self[range] {
            return String(char)
        }
        return nil
    }
}
