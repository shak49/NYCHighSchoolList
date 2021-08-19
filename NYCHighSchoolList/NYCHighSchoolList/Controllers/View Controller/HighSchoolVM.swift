//
//  HighSchoolViewModel.swift
//  NYCHighSchoolList
//
//  Created by Shak Feizi on 8/18/21.
//

import UIKit

//class HighSchoolVM {
//    // Shak notes: Properties
//    var schoolArray: [HighSchool]? = []
//    var highSchool: HighSchool?
//    static let sharedVM: HighSchoolVM = HighSchoolVM()
//    
//    // Shak notes: Functions
//    func fetchHighSchoolsNameForView() {
//        HighSchoolController.sharedInstance.fetchHighSchoolName(completion: { (result) in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let schools):
//                    print(schools)
//                    self.schoolArray = Utility.sharedUtility.convertToArrayOfDictionary(schools)
//                    print(self.schoolArray)
//                    self.fetchSATInfoForHighSchoolForView()
//                case .failure(let error):
//                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//                }
//            }
//        })
//    }
//    
//    func fetchSATInfoForHighSchoolForView() {
//        HighSchoolController.sharedInstance.fetchSATHighSchool { result in
//            switch result {
//            case .success(let sats):
//                self.addSATToHighSchool(sats)
//                print(sats)
//            case .failure(let error):
//                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
//            }
//        }
//    }
//    
//    func addSATToHighSchool(_ HS: Any) {
//        guard let hS = HS as? [[String : Any]] else { return }
//        for item in hS {
//            if let matchedId = item["dbn"] as? String {
//                var machedHighSchoolWithSAT = schoolArray?.first(where: { (highSchoolsInArray) -> Bool in
//                    return highSchoolsInArray.dbn == matchedId
//                })
//                if machedHighSchoolWithSAT != nil {
//                    if let numberOfTestTaker = item["num_of_sat_test_takers"] as? String {
//                        machedHighSchoolWithSAT?.num_of_sat_test_takers = numberOfTestTaker
//                    }
//                    if let satReadingScore = item["sat_critical_reading_avg_score"] as? String {
//                        machedHighSchoolWithSAT?.sat_critical_reading_avg_score = satReadingScore
//                    }
//                    if let satMathScore = item["sat_math_avg_score"] as? String {
//                        machedHighSchoolWithSAT?.sat_math_avg_score = satMathScore
//                    }
//                    if let satWritingScore = item["sat_writing_avg_score"] as? String {
//                        machedHighSchoolWithSAT?.sat_writing_avg_score = satWritingScore
//                    }
//                }
//            }
//        }
//    }
//}
