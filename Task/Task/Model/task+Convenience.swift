//
//  task+Convenience.swift
//  Task
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation
import CoreData

 extension Task {
    
    @discardableResult
    convenience init(name: String, notes: String, due: Date = Date(), isComplete: Bool, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.due = due
    }
}
