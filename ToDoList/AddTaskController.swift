//
//  AddTaskController.swift
//  ToDoList
//
//  Created by Paul Dornfeld on 6/13/18.
//  Copyright © 2018 Paul Dornfeld. All rights reserved.
//

import UIKit
import CoreData

class AddTaskController: UIViewController {
    
    let managedObjectContext = CoreDataStack().managedObjectContext
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let text = textField.text, !text.isEmpty else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: "Item", into: managedObjectContext) as! Item
        
        item.text = text
        
        managedObjectContext.saveChanges()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}






















