//
//  ToDoListViewControllerDelegate.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 28/6/24.
//

import UIKit

extension ToDoListViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let task = ViewModel.task(by: indexPath.row)
        let completeAction = UIContextualAction(style: .normal, title: task.completed ? "Not Completed " : "Completed") { [ weak self](action, view, completionHandler) in
            self?.completedTask(at: indexPath)
            completionHandler(true)
        }
        completeAction.backgroundColor = task.completed ? UIColor.systemRed : UIColor.systemGreen
          let configuration = UISwipeActionsConfiguration(actions: [completeAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func completedTask(at indexPath: IndexPath) {
        let task = ViewModel.task(by: indexPath.row)
        ViewModel.toggleCompletedTask(task: task)
        if task.completed {
            celebrateAnimationView.isHidden = false
            celebrateAnimationView.play { finished  in
                self.celebrateAnimationView.isHidden = finished
            }
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.reloadRows(at: [IndexPath.SubSequence(row: 0, section: 0)], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section != 0
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {
            return
        }
        let task = ViewModel.task(by: indexPath.row)
        ViewModel.deletItem(task: task)
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = ViewModel.task(by: indexPath.row)
        let vc: AddNewTaskViewController = AddNewTaskViewController()
        vc.viewModel = AddNewTaskViewModel(operationType: .update, selectedTask: task)
        self.navigationController?.pushViewController(vc, animated: true)

      //  let newViewController = TaskDetailViewController()
           // self.navigationController?.pushViewController(TaskDetailViewController(), animated: true)
    }
}
