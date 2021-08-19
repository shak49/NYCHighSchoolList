//
//  SelectionController.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/10/21.
//

import UIKit
import CoreData

class SelectionController {
    // Shak notes: Properties
    static let sharedInstance: SelectionController = SelectionController()
    var selectionArray: [Selection] = []
    
    // Shak notes: Functions
    func createSelectedItem(name: String?, sat: String?) {
        let newSelection = Selection(name: name, satTestTaker: sat)
        selectionArray.append(newSelection)
        CoreDataStack.saveContext()
    }
    
    func readRequest() {
        let selection = (try?CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(selection.count)
        self.selectionArray = selection
    }
    
    private lazy var fetchRequest: NSFetchRequest<Selection> = {
        let request = NSFetchRequest<Selection>(entityName: "Selection")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    func update(selection: Selection) {
        CoreDataStack.saveContext()
    }
    
    func deleteSelection(selection: Selection) {
        guard let index = selectionArray.firstIndex(of: selection) else { return }
        selectionArray.remove(at: index)
        CoreDataStack.context.delete(selection)
        CoreDataStack.saveContext()
    }
} //End of class

