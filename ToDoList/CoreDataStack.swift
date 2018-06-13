//
//  CoreDataStack.swift
//  ToDoList
//
//  Created by Paul Dornfeld on 6/13/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let container = self.persistentContainer
        return container.viewContext
    }()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores() { storeDescription, error in
            if let error = error as NSError? {
                fatalError("unresolved errro: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
//    private(set) lazy var applicationDocumentDirectory: URL = {
//       let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let endIndex = urls.index(before: urls.endIndex)
//        return urls[endIndex]
//    }()
//
//    private(set) lazy var managedObjectModel: NSManagedObjectModel = {
//       let modelUrl = Bundle.main.url(forResource: "ToDoList", withExtension: "momd")!
//        return NSManagedObjectModel(contentsOf: modelUrl)!
//    }()
//
//    private(set) lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
//       let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
//
//        let url = self.applicationDocumentDirectory.appendingPathComponent("ToDoList.sqlite")
//
//        do {
//            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url)
//        } catch {
//            print(error)
//            abort()
//        }
//
//        return coordinator
//
//    }()
//
//    lazy var managedObjectContext: NSManagedObjectContext = {
//       let coordinator = self.persistentStoreCoordinator
//        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        moc.persistentStoreCoordinator = coordinator
//        return moc
//    }()
    
}

















