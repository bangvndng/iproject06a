//
//  Store.swift
//  ToDoList
//
//  Created by Bang Vu on 6/26/17.
//  Copyright © 2017 Bang Vu. All rights reserved.
//

import UIKit
import CoreData

enum CheckListResult {
    case success([Checklist])
    case failure(Error)
}

enum TaskResult {
    case success([Task])
    case failure(Error)
}

class Store {
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CheckListCD")
        container.loadPersistentStores{
            (description, error) in
            if let error = error {
                print("Error setting up Core Data")
            }
        }
        
        return container
        
    }()
    
    func fetchAllCheckList(completion: @escaping(CheckListResult) -> Void){
        let fetchRequest: NSFetchRequest<Checklist> = Checklist.fetchRequest()
        let sortByName = NSSortDescriptor(key: #keyPath(Checklist.listName), ascending: true)
        
        fetchRequest.sortDescriptors = [sortByName]
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            do {
                let allTags = try viewContext.fetch(fetchRequest)
                completion(.success(allTags))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    func fetchAllTask(completion: @escaping(TaskResult) -> Void){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let sortByName = NSSortDescriptor(key: #keyPath(Task.taskName), ascending: true)
        
        fetchRequest.sortDescriptors = [sortByName]
        let viewContext = persistentContainer.viewContext
        viewContext.performAndWait {
            do {
                let allTags = try viewContext.fetch(fetchRequest)
                completion(.success(allTags))
            } catch {
                completion(.failure(error))
            }
        }
    }

}
