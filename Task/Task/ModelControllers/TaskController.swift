//
//  TaskController.swift
//  Task
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
    
    static let shared = TaskController()
    
    var tasks = [Task]()
    
    init() {
        tasks = fetchTasks()
    }
    
    var mockTasks: [Task] = [
        Task(name: "mike", notes: "asdfafbqe", due: Date()),
        Task(name: "jim", notes: "adfbebtbqtqer", due: Date()),
        Task(name: "pam", notes: "eadvadvadad", due: Date()),
        Task(name: "andy", notes: "adfabfwrtwrty", due: Date())
    ]
    
   
    
    func fetchTasks() -> [Task] {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            return try CoreDataStack.context.fetch(fetchRequest)
        } catch {
            print(error)
            return []
        }
        
    }
    
    
    // Create
    func createTask(name: String, notes: String?, due: Date?) {
        if let notes = notes, let due = due {
            _ = Task(name: name, notes: notes, due: due)
        }
            saveToPersistentStore()
    }
    
    // Update
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStore()
    }
    
    // Remove
    func remove(task: Task, name: String, notes: String?, due: Date?) {
        CoreDataStack.context.delete(task)
        saveToPersistentStore()
    }
    
    // Save
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error trying to save data in \(#function) \(error.localizedDescription)")
        }
    }
    
}
