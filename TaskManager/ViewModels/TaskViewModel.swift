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
        task.task_name ?? ""
    }
    
    var desp: String {
        task.task_details ?? ""
    }
    var dueDate: Date {
        task.due_date ?? Date()
        
    }
    var completedOn: Date {
        task.completion_date ?? Date()
        
    }
    var completed: Bool {
        task.task_status
    }
}
