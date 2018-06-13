//
//  Item+CoreDataProperties.swift
//  ToDoList
//
//  Created by Paul Dornfeld on 6/13/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var text: String
    @NSManaged public var isCompleted: Bool

}
