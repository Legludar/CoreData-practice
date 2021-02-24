//
//  AddNewTaskViewController.swift
//  CoreDataPractice
//
//  Created by David on 2/24/21.
//

import UIKit

class AddNewTaskViewController: UITableViewController {
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskdueDate: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        taskdueDate.minimumDate = Date()
        //tableView.tableFooterview = UIView()
    }
    @IBAction func saveNewTask(_sender: UIBarButtonItem){
        let vm = AddNewTaskViewModel(name: taskName.text ?? "No Name", date: taskdueDate.date)
        vm.saveTask{_ in
            DispatchQueue.main.async {
                self.navigationController?
                    .popViewController(animated: true)
            }
        }
    }
}
