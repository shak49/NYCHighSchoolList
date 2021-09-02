//
//  ViewController.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/9/21.
//

import UIKit

class DetailViewController: UIViewController {
    // Shak notes: Properties
    var highSchool: HighSchool?
    var schoolArray: [HighSchool]? = []
    
    // Shak notes: Oulets
    @IBOutlet weak var studentLabel: CustomLabel!
    @IBOutlet weak var mathLabel: CustomLabel!
    @IBOutlet weak var readingLabel: CustomLabel!
    @IBOutlet weak var writingLabel: CustomLabel!
    
    @IBOutlet weak var viewForStudents: CustomButton!
    @IBOutlet weak var viewForMathScore: CustomButton!
    @IBOutlet weak var viewForReadingScore: CustomButton!
    @IBOutlet weak var viewForWritingScore: CustomButton!
    
    @IBOutlet weak var highSchoolLabel: UILabel!
    @IBOutlet weak var SATRateLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray5
        setupView()
    }
    
    // Shak notes: Actions
    @IBAction func addButton(_ sender: Any) {
        guard let name = highSchoolLabel.text, !name.isEmpty,
              let sat = SATRateLabel.text, !sat.isEmpty else { return }
        SelectionController.sharedInstance.createSelectedItem(name: name, sat: sat)
        navigationController?.popViewController(animated: true)
    }
    
    // Shak notes: Functions
    func setupView() {
        // School name
        highSchoolLabel.text = self.highSchool?.school_name
        // Test taker
        if highSchool?.num_of_sat_test_takers != nil {
            SATRateLabel.text = highSchool?.num_of_sat_test_takers
        } else {
            SATRateLabel.text = "0"
        }
        // Reading score
        if highSchool?.sat_critical_reading_avg_score != nil {
            readingScoreLabel.text = highSchool?.sat_critical_reading_avg_score
        } else {
            readingScoreLabel.text = "0"
        }
        // Math score
        if highSchool?.sat_math_avg_score != nil {
            mathScoreLabel.text = highSchool?.sat_math_avg_score
        } else {
            mathScoreLabel.text = "0"
        }
        // Writing score
        if highSchool?.sat_writing_avg_score != nil {
            writingScoreLabel.text = highSchool?.sat_writing_avg_score
        } else {
            writingScoreLabel.text = "0"
        }
    }
} //End of class

