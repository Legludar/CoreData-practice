//
//  Todo+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by David on 2/23/21.
//
//

import Foundation
import CoreData


extension Todo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Todo> {
        return NSFetchRequest<Todo>(entityName: "Todo")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var dueDate: Date?
    @NSManaged public var completedDate: Date?
    @NSManaged public var completed: Bool

}

extension Todo : Identifiable {

}
