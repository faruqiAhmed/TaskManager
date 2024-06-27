//
//  TaskViewModel.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 26/6/24.
//

import Foundation
struct TaskViewModel {
    private var task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    var id: UUID {
        task.id ?? UUID()
    }
    
    var name: String {
        task.name ?? ""
    }
    
    var desp: String {
        task.desp ?? ""
    }
    var dueDate: Date {
        task.dueDate ?? Date()
        
    }
    var completedOn: Date {
        task.completedOn ?? Date()
        
    }
    var completed: Bool {
        task.completed
    }
    
    
}

