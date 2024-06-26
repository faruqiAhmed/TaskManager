//
//  TaskListViewModel.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 26/6/24.
//

import Foundation
class TaskListViewModel {
    let tasks = [TaskViewModel]()
    init () {
        getAll()
    }
    var numberOfTask: Int {
        tasks.count
    }
    
    func getAll () {
        
    }
    
    func numberOfRows(by section: Int) -> Int {
        if  section == 0 {
            return 1
        }
        return numberOfTask
    }
    
    func getTasksByType() -> (complete: Int, Incomplete: Int) {
    let completedCount = tasks.lazy.filter({ $0.completed }).count
    let incompleteCount = tasks.lazy.filter({!$0.completed}).count
     return (completedCount, incompleteCount)
    }
    
    func task( by index: Int) -> TaskViewModel{
        tasks[index]
    }
    
    func  toggleCompletedTask(task: TaskViewModel) {
        getAll()
    }
    func deletItem(task: TaskViewModel) {
        getAll()
        
    }
    
}
