//
//  QueueUtility.swift
//  dSwiftUtils
//
//  Created by DRUVAKANTH YARLAGADDA on 4/22/16.
//
//

import Foundation

public enum QueuePriority {
    case Low
    case Default
    case High
    case Background
}

public class QueueUtility {
    public static func getQueueId(priority:QueuePriority)->dispatch_queue_priority_t {
        switch priority {
        case .Low:              return DISPATCH_QUEUE_PRIORITY_LOW
        case .Default:          return DISPATCH_QUEUE_PRIORITY_DEFAULT
        case .High:             return DISPATCH_QUEUE_PRIORITY_HIGH
        case .Background:       return DISPATCH_QUEUE_PRIORITY_BACKGROUND
        }
    }
}
