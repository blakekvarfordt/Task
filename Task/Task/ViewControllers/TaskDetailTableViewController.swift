//
//  TaskDetailTableViewController.swift
//  Task
//
//  Created by Blake kvarfordt on 8/7/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?
//    {
//        didSet {
//            loadViewIfNeeded()
//            updateViews()
//        }
//    }
    
    var dueDateValue: Date?
    
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var dueDateTextField: UITextField!
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        dueDateTextField.inputView = dueDatePicker
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, let notes = notesTextView.text else { return }
        
        if task == nil {
            TaskController.shared.createTask(name: name, notes: notes, due: dueDateValue)
        } else {
            guard let task = task else { return }
            TaskController.shared.update(task: task, name: name, notes: notes, due: dueDateValue)
            updateViews()
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerValueChaged(_ sender: Any) {
        task?.due = dueDateValue
        dueDateTextField.text = task?.due?.stringValue()
    }
    @IBAction func userTappedView(_ sender: Any) {
        resignFirstResponder()
    }
    
    // MARK: - UpdateViews
    func updateViews() {
        guard let task = task else { return }
            nameTextField.text = task.name
            notesTextView.text = task.notes
            dueDateTextField.text = task.due?.stringValue()
    }
    
}
