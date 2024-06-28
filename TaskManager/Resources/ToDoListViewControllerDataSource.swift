//
//  ToDoListViewControllerDataSource.swift
//  TaskManager
//
//  Created by Md Omar Faruq on 28/6/24.
//

import UIKit
extension ToDoListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewModel.numberOfRows(by: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryCell", for:indexPath) as? SummaryTableViewCell
            else {
                return UITableViewCell()
            }
            let taskSummary = ViewModel.getTasksByType()
            cell.configure(completed: taskSummary.complete.description, incompleted: taskSummary.Incomplete.description)
            return cell
        }
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as? ToDoTableViewCell
        else {
            return UITableViewCell()
        }
        let task = ViewModel.task(by: indexPath.row)
        cell.configure(with: task)
        return cell
    }
    
    
}
