//
//  CoreDataManager.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 27/6/24.
//

import CoreData
import Foundation

class CoreDataManager {
  
    static let shared = CoreDataManager()
    
    private init() {}
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error\(error),\(error.userInfo)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Error saving the staged changes \(nserror),\(nserror.userInfo)")
            }
        }
    }
    
    func getAll() -> [Task] {
        var tasks = [Task] ()
        let fatchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortByDueDate = NSSortDescriptor(key: "due_date", ascending: true)
        fatchRequest.sortDescriptors = [sortByDueDate]
        do {
            tasks = try context.fetch(fatchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return tasks
    }
    
    func addNewTask(name: String , details: String , dueDate: Date) {
        let task = Task(context: context)
        task.task_name = name
        task.task_details = details
        task.due_date = dueDate
        
        task.id = UUID()
        task.task_status = false
        task.completion_date = dueDate.advanced(by: 100000)
        saveContext()
    }
    
    func updateTask(id: UUID, name: String , details: String , dueDate: Date) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id=%@", id.uuidString)
        do {
            let fetchedTasks = try context.fetch(fetchRequest)
            if let dbTask = fetchedTasks.first {
                dbTask.task_name = name
                dbTask.task_details = details
                dbTask.due_date = dueDate
                dbTask.completion_date = dueDate.advanced(by: 100000)
            }
            saveContext()
        } catch  let  error {
            print(error.localizedDescription)
        }
    }
    
    
    func toggleCompleted(id: UUID) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let predicate = NSPredicate(format: "id=%@",id.uuidString)
        fetchRequest.predicate = predicate
        do {
//            let fetchedTasks = try context.fetch(fetchRequest)
//            for task in fetchedTasks {
//                if task.completed {
//                    task.completedOn = Date()
//                }
//            }
            if let fetchedTask = try context.fetch(fetchRequest).first(where: { $0.id == id}){
                fetchedTask.task_status = !fetchedTask.task_status
                if fetchedTask.task_status {
                    fetchedTask.completion_date = Date()
                }
            }
            saveContext()
            
        } catch let error as NSError  {
            print("Error toggleing state:\(error.userInfo),\(error.localizedDescription)")
            
        }
    }
    
    func deleteTask(by id: UUID) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id=%@", id.uuidString)
        do {
            let fetchedTasks = try context.fetch(fetchRequest)
            for task in fetchedTasks {
                context.delete(task)
            }
            saveContext()
        } catch  let  error {
            print(error.localizedDescription)
        }
    }
    
    
}
