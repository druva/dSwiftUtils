//
//  HTTPUtils.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/23/16.
//
//

import Foundation


public protocol HTTPErrorPolicyDelegate {
    init()
    func processHttpError()
}


import Foundation

public typealias ResponseDataCallback = (statusCode:Int, headerFields:[String:String]?, body:NSData?, error:NSError?)->Void

public class HTTPRequest {
    public init(){}
    
    public static func processRequest(url:String, headerFields:[String:String?]?)->NSMutableURLRequest {
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        request.HTTPMethod = "GET"
        let postString = "id=13&name=Jack"
        if request.HTTPMethod == "POST" {
            request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        }
        // update header fields
        if let headers = headerFields {
            var fields = request.allHTTPHeaderFields ?? [String : String]()
            for (key,value) in headers {
                if let value = value {
                    fields[key] = value
                }
            }
            request.allHTTPHeaderFields = fields
        }
        
        return request
    }
    
    public func sendRequest(request: NSMutableURLRequest, errorPolicy:HTTPErrorPolicyDelegate, callback:ResponseDataCallback)->String {
        
        let semaphore = dispatch_semaphore_create(0)
        var returnValue = "nothing"
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            httpResult, urlResponse, resultError in
            let responseTime = NSDate().timeIntervalSince1970 // A little late, since full request recieved.
            print(responseTime)
            if resultError == nil, let response = urlResponse as? NSHTTPURLResponse {
                var responseHeaderFields = [String:String]()
                for (key,value) in response.allHeaderFields {
                    if let key = key as? String, value = value as? String {
                        responseHeaderFields[key.lowercaseString] = value
                    }
                }
                if let date = responseHeaderFields["date"] {
                    //print("responseHeaderFields \(date)")
                }
                //print("response.statusCode \(response.statusCode)")
                //print("responseHeaderFields \(responseHeaderFields)")
                //print("result Error \(resultError)")
                //print("httpResult \(httpResult)")
                returnValue = "someThing"
                dispatch_semaphore_signal(semaphore)
                callback(statusCode: response.statusCode, headerFields: responseHeaderFields, body: httpResult, error: resultError)
            } else {
                returnValue = "error"
                dispatch_semaphore_signal(semaphore)
                callback(statusCode: -1, headerFields: nil, body: nil, error: resultError)
            }
        }
        task.resume()
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return returnValue
    }
}