//
//  AddNewTaskViewModel.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 27/6/24.
//

import Foundation

class AddNewTaskViewModel {
    func addTask(name: String, desp: String, dueDate: Date){
        CoreDataManager.shared.addNewTask(name: name, desp: desp, dueDate: dueDate)
    }
}

