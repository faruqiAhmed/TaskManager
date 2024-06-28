//
// ToDoListViewController.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 26/6/24.
//

import UIKit

class ToDoListViewController: UIViewController {
    let ViewModel = TaskListViewModel()
    lazy var tableView: UITableView = {
        
        let v = UITableView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.dataSource = self
        v.delegate = self
        v.register(ToDoTableViewCell.self, forCellReuseIdentifier: "ToDoCell")
        v.register(SummaryTableViewCell.self, forCellReuseIdentifier: "SummaryCell")
        v.estimatedRowHeight = 200
        v.rowHeight = UITableView.automaticDimension
        return v
    }()
    
    
    lazy var celebrateAnimationView: CelebrationAnimationView = {
        let v = CelebrationAnimationView(fileName:"1719549734134")
        v.translatesAutoresizingMaskIntoConstraints = false
        v.isHidden = true
        return v
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Task Manager"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
        view.addSubview(celebrateAnimationView)
        
        NSLayoutConstraint.activate([
            celebrateAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            celebrateAnimationView.topAnchor.constraint(equalTo: view.topAnchor),
            celebrateAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            celebrateAnimationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
//        view.addSubview(celebrateAnimationView)
//        NSLayoutConstraint.activate([
//            celebrateAnimationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            celebrateAnimationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            celebrateAnimationView.topAnchor.constraint(equalTo: view.topAnchor),
//            celebrateAnimationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
        
    }
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        celebrateAnimationView.play {  finished  in
//            print(" Done Playing")
//        }
//    }
    
    @objc
    func addNewTask() {
        navigationController?.pushViewController(AddNewTaskViewController(), animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        ViewModel.getAll()
        tableView.reloadData()
    }
}







// rfe
//class ToDoListViewController: UIViewController {
//
//    lazy var addNewButton: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.setTitle("Add Task", for: .normal)
//        v.setTitleColor(UIColor.black, for: .normal)
//      
//        v.addTarget(self, action: #selector(AddNewTaks(sender:)), for:.touchUpInside)
//        return v
//    }()
//    lazy var getTaskButton: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.setTitle("Get Task", for: .normal)
//        v.setTitleColor(UIColor.black, for: .normal)
//      
//        v.addTarget(self, action: #selector(getTask(sender:)), for:.touchUpInside)
//        return v
//    }()
//    
//    lazy var toggleCompletedButton: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.setTitle("Mark Task Completed", for: .normal)
//        v.setTitleColor(UIColor.black, for: .normal)
//      
//        v.addTarget(self, action: #selector(markCompleted(sender:)), for:.touchUpInside)
//        return v
//    }()
//    
//    lazy var deleteTaskButton: UIButton = {
//        let v = UIButton()
//        v.translatesAutoresizingMaskIntoConstraints = false
//        v.setTitle("Delete Task", for: .normal)
//        v.setTitleColor(UIColor.black, for: .normal)
//      
//        v.addTarget(self, action: #selector(deleteTask(sender:)), for:.touchUpInside)
//        return v
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        title = "Task Manager"
//        [addNewButton,getTaskButton, toggleCompletedButton,deleteTaskButton].forEach { control in
//            view.addSubview(control)
//        }
//        // add constraints
//        NSLayoutConstraint.activate([
//            addNewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            addNewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            addNewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
//            
//            getTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            getTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            getTaskButton.topAnchor.constraint(equalTo: addNewButton.bottomAnchor, constant: 8),
//            
//            toggleCompletedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            toggleCompletedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            toggleCompletedButton.topAnchor.constraint(equalTo: getTaskButton.bottomAnchor, constant: 8),
//            
//            deleteTaskButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            deleteTaskButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            deleteTaskButton.topAnchor.constraint(equalTo: toggleCompletedButton.bottomAnchor, constant: 8),
//            
//            
//            
//        ])
//        
//    }
//
//@objc
//    func AddNewTaks(sender: UIButton) {
//        CoreDataManager.shared.addNewTask(name: "add New Task", desp: "New Note", dueDate: Date().addingTimeInterval(100000))
//    }
//    
//    @objc
//    func getTask(sender: UIButton) {
//     let tasks = CoreDataManager.shared.getAll()
//        for task in tasks {
//            print("\(task.name ?? ""): \(task.desp ?? "")")
//        }
//    }
//    
//    @objc
//    func markCompleted(sender: UIButton) {
//        let tasks = CoreDataManager.shared.getAll()
//        for task in tasks {
//            CoreDataManager.shared.toggleCompleted(id: task.id ?? UUID())
//        }
//        
//        let fetchedtasks = CoreDataManager.shared.getAll()
//        for task in tasks {
//            print("\(task.name ?? ""): \(task.desp ?? ""): \(task.completed), \(task.completedOn?.formatted(date: .abbreviated, time: .omitted) ?? "") ")
//        }
//    }
//    @objc
//    func deleteTask(sender: UIButton) {
//        let tasks = CoreDataManager.shared.getAll()
//        for task in tasks {
//            CoreDataManager.shared.deleteTask(id: task.id ?? UUID())
//        }
//        
//        let fetchedtasks = CoreDataManager.shared.getAll()
//        print(tasks.count)
//        for task in tasks {
//            print("\(task.name ?? ""): \(task.desp ?? ""): \(task.completed), \(task.completedOn?.formatted(date: .abbreviated, time: .omitted) ?? "") ")
//        }
//    }
//    
//}
//
