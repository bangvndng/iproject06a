//
//  ViewController.swift
//  ToDoList
//
//  Created by Bang Vu on 6/26/17.
//  Copyright © 2017 Bang Vu. All rights reserved.
//

import UIKit

class CheckListVC: UITableViewController {

    var store: Store!
    
    var lists: [Checklist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        store = Store()
        self.updateData()
    }
    
    func updateData(){
        store.fetchAllCheckList(){
            (checkListResults) in
            switch checkListResults{
            case let .success(checklists):
                self.lists = checklists
            case let .failure(error):
                print("\(error)")
            }
            
            self.tableView.reloadSections(IndexSet(integer:0), with: .automatic)
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        self.updateData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addCheckList"?:
            let checkListVC = segue.destination as! ToDoList.AddCheckListVC
            checkListVC.store = store

        case "viewTasksList"?:
            
            if let selectedIndex = tableView.indexPathForSelectedRow {
                let row = selectedIndex.row
                let checklist = lists[row]
                let taskListVC = segue.destination as! TaskListVC
                taskListVC.store = store
                taskListVC.checklist = checklist
            }
            
            
            
        default:
            preconditionFailure("UnExpected segure")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListCell", for: indexPath)
        let checklist = lists[indexPath.row]
        cell.textLabel?.text = checklist.listName
        
        return cell
    }


}

