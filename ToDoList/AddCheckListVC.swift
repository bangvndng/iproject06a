//
//  AddCheckListVC.swift
//  ToDoList
//
//  Created by Bang Vu on 6/26/17.
//  Copyright © 2017 Bang Vu. All rights reserved.
//

import UIKit

class AddCheckListVC: UITableViewController {
    
    var store: Store!
    
    var name: String?
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nameEdited(_ sender: UITextField) {
        if let text = sender.text {
            name = text
        }
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let name = self.name {
            // Add List
            var checkList: Checklist!
            
            let context = store.persistentContainer.viewContext
            context.performAndWait {
                checkList = Checklist(context: context)
                checkList.listName = name
            }
            
            do {
                try context.save()
            } catch let error {
                print("\(error)")
            }
            
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListNameCell", for: indexPath)
            return cell
            
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListIconCell", for: indexPath)
            return cell
        }
        
    }
    
}
