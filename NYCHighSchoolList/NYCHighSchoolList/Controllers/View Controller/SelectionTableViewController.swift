//
//  SelectionTableViewController.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/10/21.
//

import UIKit

class SelectionTableViewController: UITableViewController {
    // Shak notes: Properties
    var selection: [Selection] = []
    
    // Shak notes: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSelection()
    }
    
    // Shak notes: Functions
    func fetchSelection() {
        DispatchQueue.main.async {
            SelectionController.sharedInstance.readRequest()
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SelectionController.sharedInstance.selectionArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectionCell", for: indexPath)
        let selection = SelectionController.sharedInstance.selectionArray[indexPath.row]
        cell.textLabel?.text = selection.name
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 20
        cell.layer.shadowColor = CGColor.init(gray: 15, alpha: 1)
        cell.layer.shadowRadius = 5
        tableView.backgroundColor = UIColor.systemGray5
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteIndex = SelectionController.sharedInstance.selectionArray[indexPath.row]
            SelectionController.sharedInstance.deleteSelection(selection: deleteIndex)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
