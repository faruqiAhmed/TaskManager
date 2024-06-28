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
    }

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





