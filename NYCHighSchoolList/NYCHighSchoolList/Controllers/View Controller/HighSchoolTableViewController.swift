//
//  HighSchoolTableViewController.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/9/21.
//

import UIKit

class HighSchoolTableViewController: UITableViewController {
    // Shak notes: Properties
    var schoolArray: [HighSchool]? = []
    var highSchool: HighSchool?
    
    
    // Shak notes: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchHighSchoolsNameForView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //fetchHighSchoolsNameForView()
    }
    
    // Shak notes: Functions
    func fetchHighSchoolsNameForView() {
        HighSchoolController.sharedInstance.fetchHighSchoolName(completion: { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let schools):
                    print(schools)
                    self.schoolArray = Utility.sharedUtility.convertToArrayOfDictionary(schools)
                    print(self.schoolArray)
                    self.fetchSATInfoForHighSchoolForView()
                    self.tableView.reloadData()
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
                }
            }
        })
    }
    
    func fetchSATInfoForHighSchoolForView() {
        HighSchoolController.sharedInstance.fetchSATHighSchool { result in
            switch result {
            case .success(let sats):
                self.addSATToHighSchool(sats)
                print(sats)
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
    }
    
    func addSATToHighSchool(_ HS: Any) {
        guard let hS = HS as? [[String : Any]] else { return }
        for item in hS {
            if let matchedId = item["dbn"] as? String {
                var machedHighSchoolWithSAT = schoolArray?.first(where: { (highSchoolsInArray) -> Bool in
                    return highSchoolsInArray.dbn == matchedId
                })
                if machedHighSchoolWithSAT != nil {
                    if let numberOfTestTaker = item["num_of_sat_test_takers"] as? String {
                        machedHighSchoolWithSAT?.num_of_sat_test_takers = numberOfTestTaker
                    }
                    if let satReadingScore = item["sat_critical_reading_avg_score"] as? String {
                        machedHighSchoolWithSAT?.sat_critical_reading_avg_score = satReadingScore
                    }
                    if let satMathScore = item["sat_math_avg_score"] as? String {
                        machedHighSchoolWithSAT?.sat_math_avg_score = satMathScore
                    }
                    if let satWritingScore = item["sat_writing_avg_score"] as? String {
                        machedHighSchoolWithSAT?.sat_writing_avg_score = satWritingScore
                    }
                }
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schoolArray!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "HighSchoolCell", for: indexPath)
        // Passing data through cells
        let schools = self.schoolArray?[indexPath.row]
        cell.textLabel?.text = schools?.school_name
        // Cell appearance
        cell.layer.borderWidth = 10
        cell.layer.borderColor = UIColor.systemGray5.cgColor
        cell.layer.cornerRadius = 20
        tableView.backgroundColor = UIColor.systemGray5
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Shak notes: IIDOO
        // Identifier
        if segue.identifier == "TVtoVC" {
            // Index & Destination
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? DetailViewController else { return }
            // Object to send
            let school = self.schoolArray?[indexPath.row]
            // Sent Object
            destination.highSchool = school
        }
    }
}
