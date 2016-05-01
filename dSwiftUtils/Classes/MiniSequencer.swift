//
//  MiniSequencer.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/30/16.
//
//

import Foundation

public class MiniSequencer {
    //    private var _updateSequence = [voidCallback]()
    private var _index = 0
    private var _seq:[voidCallback]?
    private var _callback:voidCallback?
    private var _completionCallback:callbackWithStatus?
    public init() {
    }
    
    public func startSeq(seq:[voidCallback], completionCallback:callbackWithStatus) {
        _index = 0
        _seq = seq
        _callback = {
            if self._index < self._seq?.count {
                seq[self._index]()
            } else {
                completionCallback(status: true)
            }
        }
        _callback!()
    }
    public func taskFinished(status:Bool){
        if status {
            _index++
            _callback!()
        } else {
            print("ERROR !! MiniSequencer failed at index \(index)")
            _completionCallback!(status: false)
        }
    }
}

public class TestMiniSequencer {
    public init(){
        let a = MiniSequencer()
        
        var seq = [voidCallback]()
        seq.append({self.update("categorys", callback: a.taskFinished)})
        seq.append({self.update("decades", callback: a.taskFinished)})
        seq.append({self.update("languages", callback: a.taskFinished)})
        
        a.startSeq(seq) { (status) -> Void in
            if status {
                print("success")
            } else {
                print("failed")
            }
        }
    }
    
    public func update(name:String, callback:callbackWithStatus ){
        print(name)
        callback(status: true)
    }
}