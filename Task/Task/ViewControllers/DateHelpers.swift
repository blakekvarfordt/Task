//
//  DateHelpers.swift
//  Task
//
//  Created by Blake kvarfordt on 8/8/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

extension Date {
    
    func stringValue() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
    
    
}
