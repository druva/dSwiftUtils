//
//  SequenceUtility.swift
//  Pods
//
//  Created by DRUVAKANTH YARLAGADDA on 4/22/16.
//
//

import Foundation

public class Sequence {
    public init(){}
    public var sequenceName:String = ""
    public var sequenceTasks = [SequenceTask]()
    private var index = 0;
    
    public init (name:String, tasks:[SequenceTask]) {
        self.sequenceName = name
        self.sequenceTasks = tasks
    }
    public func start() {
        print("Sequence.start() \(sequenceName)")
        index = 0
        executeNextAvailableTask()
    }
    private func executeTaskWithIndex(i:Int){
        let task:SequenceTask = sequenceTasks[i]
        task.taskFinished = onTaskFinished
        Schedular.scheduleTask(task, priority: .Background)
    }
    private func executeNextAvailableTask(){
        if sequenceTasks.count > 0 {
            print(sequenceTasks[index].getTaskName)
            executeTaskWithIndex(index)
        }
    }
    public func onTaskFinished(){
        print("Sequence.onTaskFinished()")
        if index < sequenceTasks.count-1 {
            index++
            executeNextAvailableTask()
        }
    }
}

public class Schedular {
    public init(){}
    static func scheduleTask(task:Task, priority:QueuePriority = .Default){
        dispatch_async(dispatch_get_global_queue(QueueUtility.getQueueId(priority), 0)) {
            task.execute()
        }
    }
}

public class SequenceTask: Task {
    public var getTaskName: String {
        get {
            return NSStringFromClass(self.dynamicType)
        }
    }
    override public func execute() {
        print("You must override this method and call taskFinished at end of the method")
    }
    public var taskFinished:voidCallback = {}
}

public class Task {
    public init(){}
    public func execute() {
        print("You must override this method")
    }
}
