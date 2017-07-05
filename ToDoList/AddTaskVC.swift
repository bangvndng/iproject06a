//
//  AddTaskVC.swift
//  ToDoList
//
//  Created by Bang Vu on 6/26/17.
//  Copyright © 2017 Bang Vu. All rights reserved.
//

import UIKit

class AddTaskVC: UITableViewController {
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskNameCellId", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskReminderCellId", for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskDateCellId", for: indexPath)
            return cell
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
