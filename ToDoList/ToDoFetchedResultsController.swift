//
//  ToDoFetchedResultsController.swift
//  ToDoList
//
//  Created by Paul Dornfeld on 6/14/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit
import CoreData

class ToDoFetchedResultsController: NSFetchedResultsController<Item>, NSFetchedResultsControllerDelegate {
    
    private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, tableView: UITableView) {
        self.tableView = tableView
        super.init(fetchRequest: Item.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    func tryFetch(){
        do {
            try performFetch()
        } catch {
            print("unresolved error: \(error.localizedDescription)")
        }
    }
    
    //    MARK: Fetched Results Controller Delegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
    
}





























