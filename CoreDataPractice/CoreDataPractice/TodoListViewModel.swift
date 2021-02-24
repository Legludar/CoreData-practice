//
//  TodoListViewModel.swift
//  CoreDataPractice
//
//  Created by David on 2/24/21.
//

import Foundation

class TodoListViewModel{
    var todos = [Todo]()
    var count: Int{
        return todos.count
    }
    
    init() {
        self.refreshData()
    }
    
    func todoAtIndex(_ index: Int) -> Todo {
        return todos[index]
    }
    
    func refreshData(){
        self.todos = CoreDataManager.shared.getAlltodos()
    }
}
