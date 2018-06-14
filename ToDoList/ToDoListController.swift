//
//  ToDoListController.swift
//  ToDoList
//
//  Created by Paul Dornfeld on 6/13/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit
import CoreData

class ToDoListController: UITableViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    lazy var fetchedResultsController: ToDoFetchedResultsController = {
        return ToDoFetchedResultsController(managedObjectContext: managedObjectContext, tableView: tableView)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let item = fetchedResultsController.object(at: indexPath)
        managedObjectContext.delete(item)
        managedObjectContext.saveChanges()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)

        return configureCell(cell, at: indexPath)
    }
    
    private func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = item.text
        return cell
    }
    
    //    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newItem" {
            let navigationController = segue.destination as! UINavigationController
            let addTaskController = navigationController.topViewController as! AddTaskController
            addTaskController.managedObjectContext = self.managedObjectContext
        } else if segue.identifier == "showToDo" {
            guard let detailVC = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else { return }
            let item = fetchedResultsController.object(at: indexPath)
            detailVC.item = item
            detailVC.context = self.managedObjectContext
        }
    }

}


















