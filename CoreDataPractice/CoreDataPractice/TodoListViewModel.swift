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
    
    func completeTaskAtIndex(_ index: Int, competion: @escaping(Bool) -> Void){
        self.refreshData()
        CoreDataManager.shared.completeTask(todo: todos[index], completion: competion)
    }
    
    func deleteTask(_ index: Int, completion: @escaping(Bool) -> Void){
        CoreDataManager.shared.deleteTask(todo: todos[index]){
            (_) in
            self.refreshData()
            completion(true)
        }
        
    }
}
