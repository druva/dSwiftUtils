//
//  NSRegularExpression.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/25/16.
//
//

import Foundation

extension NSRegularExpression {
    public static func regex(pattern: String, ignoreCase: Bool = false) -> NSRegularExpression? {
        let options: NSRegularExpressionOptions = ignoreCase ? [.CaseInsensitive]: []
        var regex: NSRegularExpression?
        do {
            regex = try NSRegularExpression(pattern: pattern, options: options)
        } catch {
            regex = nil
        }
        return regex
    }
}
