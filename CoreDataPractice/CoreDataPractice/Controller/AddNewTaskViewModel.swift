//
//  AddNewTaskViewModel.swift
//  CoreDataPractice
//
//  Created by David on 2/24/21.
//

import Foundation

class AddNewTaskViewModel{
    var name: String
    var date: Date
    
    init(name: String, date: Date) {
        self.name = name
        self.date = date
    }
    
    func saveTask(completion: @escaping(Bool) -> Void){
        CoreDataManager.shared.saveTodo(name: self.name, dueDate: self.date, completion: completion)
    }
}
