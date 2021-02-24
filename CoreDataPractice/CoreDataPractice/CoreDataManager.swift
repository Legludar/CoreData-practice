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
