//
//  AddNewTaskViewModel.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 27/6/24.
//

import Foundation

class AddNewTaskViewModel {
    
    var operationType: CrudOperation
    var selectedTask: TaskViewModel?
    
    init(operationType: CrudOperation = .crete, selectedTask: TaskViewModel? = nil) {
        self.operationType = operationType
        self.selectedTask = selectedTask
    }
    
    func addTask(name: String, desp: String, dueDate: Date){
        CoreDataManager.shared.addNewTask(name: name, desp: desp, dueDate: dueDate)
    }
    
    func updateTask(id: UUID, name: String, desp: String, dueDate: Date){
        CoreDataManager.shared.updateTask(id: id, name: name, desp: desp, dueDate: dueDate)
    }
    
    var barButtonTitle: String {
        switch operationType {
        case .crete:
            return "Save"
        case .update:
            return "Update"
        }
    }
    
    var navigationTitle: String {
        switch operationType {
        case .crete:
            return "Add New Task"
        case .update:
            return "Update Task"
        }
    }
    
    
    
    var taskName: String {
        guard let selectedTask = selectedTask else {
            return ""
        }
        return selectedTask.name
    }
    
    var details: String {
        guard let selectedTask = selectedTask else {
            return ""
        }
        return selectedTask.desp
    }
    
    var dueDate: Date {
        guard let selectedTask = selectedTask else {
            return Date()
        }
        return selectedTask.dueDate
    }
    
    var taskId: UUID {
        guard let selectedTask = selectedTask else {
            return UUID()
        }
        return selectedTask.id
    }
}


enum CrudOperation {
    case crete
    case update
}
