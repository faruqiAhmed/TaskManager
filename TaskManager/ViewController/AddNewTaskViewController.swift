//
//  AddNewTaskViewController.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 27/6/24.
//

import UIKit

class AddNewTaskViewController: UIViewController {

 lazy  var taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Task Name"
        return label
    }()
    
    
  lazy  var taskDescriptionLabel: UILabel = {
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Task Description"
        return label
    }()
    
    lazy var taskNameTextField:  UITextField = {
        let v = UITextField ()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.placeholder = "Enter Task Name"
        v.borderStyle = .roundedRect
        
        return v
    }()
    
    lazy var descriptionTextField:  UITextField = {
        let v = UITextField ()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.placeholder = "Enter Task Description"
        v.borderStyle = .roundedRect
        return v
    }()
     
    lazy var dueDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Due Date"
        return label
    }()
    lazy  var duedatePicker: UIDatePicker = {
        let v = UIDatePicker()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.datePickerMode = .date
        v.minimumDate = Date()
        
        return v
        
    }()
    
    let viewModel = AddNewTaskViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.systemBackground
        title = "Add New Task"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.save, target: self, action: #selector(saveTask))
        [taskNameLabel, taskNameTextField, taskDescriptionLabel,descriptionTextField,dueDateLabel,duedatePicker].forEach { subViewToadd in
            view.addSubview(subViewToadd)
            
        }
        
        setupConstraints()
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate ([
            taskNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            taskNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            taskNameTextField.topAnchor.constraint(equalTo: taskNameLabel.topAnchor, constant: 20),
            taskNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskNameTextField.bottomAnchor, constant: 10),
//            taskDescriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
           taskDescriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionTextField.topAnchor.constraint(equalTo: taskDescriptionLabel.topAnchor, constant: 20),
            descriptionTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
           descriptionTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            dueDateLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 8),
            dueDateLabel.leadingAnchor.constraint(equalTo: descriptionTextField.leadingAnchor),
            duedatePicker.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 8),
            duedatePicker.trailingAnchor.constraint(equalTo: descriptionTextField.trailingAnchor, constant: 8),
           
        ])
    }
    
    
   
    @objc  func saveTask() {
        guard let taskName = taskNameTextField.text, !taskName.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "name can't be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default))
            present(alert, animated: true)
            return
        }
        
        guard  let desp = descriptionTextField.text else {
            return 
        }
        let duedate = duedatePicker.date
        viewModel.addTask(name: taskName, desp: desp, dueDate: duedate)
        
        navigationController?.popViewController(animated: true)
    }
}
