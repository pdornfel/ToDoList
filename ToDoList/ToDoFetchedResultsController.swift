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
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
         tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case .insert:
            guard let newIndexPath = newIndexPath else { return }
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        case .delete:
            guard let indexPath = indexPath else { return }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        case .update, .move:
            guard let indexPath = indexPath else { return }
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
}





























