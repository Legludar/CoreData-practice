//
//  CoreDataManager.swift
//  CoreDataPractice
//
//  Created by David on 2/24/21.
//

import Foundation
import CoreData

class CoreDataManager{
    static let shared = CoreDataManager()
    
    private init() {}
    
    func completeTask(todo t: Todo, completion: @escaping(Bool) -> Void){
        let request: NSFetchRequest <Todo> = Todo.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", t.id!.uuidString)
        do{
            let result = try
                persistentContainer.viewContext.fetch(request)
            if result.count > 0{
                let todo = result.first!
                todo.completed = true
                todo.completedDate = Date()
                saveContext()
                completion(true)
            }
        }catch let err{
            print(err.localizedDescription)
        }
    }
    
    func getAlltodos() -> [Todo] {
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let firstSort = NSSortDescriptor(key: #keyPath(Todo.dueDate), ascending: true)
        let secondSort = NSSortDescriptor(key: #keyPath(Todo.completed), ascending: true)
        let thirdSort = NSSortDescriptor(key: #keyPath(Todo.completedDate), ascending: true)
        request.sortDescriptors = [firstSort, secondSort, thirdSort]
            var todos = [Todo]()
            do {
                todos = try persistentContainer.viewContext.fetch(request)
            } catch let err {
                print(err.localizedDescription)
            }
            return todos
        }
    
    func saveTodo(name: String, dueDate: Date, completion: @escaping(Bool) -> Void){
        let todo = Todo(context: persistentContainer.viewContext)
        todo.name = name
        todo.dueDate = dueDate
        todo.id = UUID()
        saveContext()
        completion(true)
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataPractice")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
