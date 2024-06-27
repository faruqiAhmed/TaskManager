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
        let container = NSPersistentContainer(name: "Taks")
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
        let sortByDueDate = NSSortDescriptor(key: "DueDate", ascending: true)
        fatchRequest.sortDescriptors = [sortByDueDate]
        do {
            tasks = try context.fetch(fatchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return tasks
    }
    
    func addNewTask(name: String , desp:String , dueDate: Date) {
        let task = Task(context: context)
        task.name = name
        task.desp = desp
        task.dueDate = dueDate
        
        task.id = UUID()
        task.completed = false
        task.completedOn = dueDate.advanced(by: 100000)
        saveContext()
    }
}
