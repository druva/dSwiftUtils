//
//  UIStoryboardExtension.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/27/16.
//
//

import UIKit

extension UIStoryboard{
    public static func storyboard(name:String)->UIStoryboard {
        return UIStoryboard(name: name, bundle: nil)
    }
}

