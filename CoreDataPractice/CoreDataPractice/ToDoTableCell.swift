//
//  ToDoTableCell.swift
//  CoreDataPractice
//
//  Created by David on 2/23/21.
//

import UIKit

class ToDoTableCell: UITableViewCell{
@IBOutlet private weak var taskNameLabel: UILabel!
@IBOutlet private weak var taskDueDate: UILabel!
@IBOutlet private weak var taskCompleteDate: UILabel!
    
    var todo: Todo?{
        didSet{
            if let todo = todo{
                if todo.completed == false{
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                             todo.dueDate!.toString(format: "MM YY DD"))
                    taskCompleteDate.text = "To be completed"
                }else{
                    taskNameLabel.text = todo.name
                    taskDueDate.text = String(format: "Due on %@",
                                              todo.dueDate!.toString(format: "MM YY DD"))
                    taskCompleteDate.text = String(format:"Completed on %@",
                                                   todo.dueDate!.toString(format: "MM YY DD"))
                }
            }
        }
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
