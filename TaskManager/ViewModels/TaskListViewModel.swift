//
//  TaskListViewModel.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 26/6/24.
//

import Foundation
class TaskListViewModel {
    var tasks = [TaskViewModel]()
    init () {
        getAll()
    }
    var numberOfTask: Int {
        tasks.count
    }
    
    func getAll () {
        tasks = CoreDataManager.shared.getAll().map(TaskViewModel.init)
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
        CoreDataManager.shared.toggleCompleted(id: task.id)
        getAll()
    }
    func deletItem(task: TaskViewModel) {
        CoreDataManager.shared.deleteTask(id: task.id)
        getAll()
    }
    
}
