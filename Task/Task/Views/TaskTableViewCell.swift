//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Blake kvarfordt on 8/8/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var primaryLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: Any) {
    }
    
    func updateButton(isComplete: Bool) {
        
    }
        
}
