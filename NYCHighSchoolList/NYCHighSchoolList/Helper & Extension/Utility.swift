//
//  Utility.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/13/21.
//

import Foundation

class Utility {
    // Shak notes: Properties
    var highSchool: HighSchool?
    var schoolArray: [HighSchool]? = []
    static let sharedUtility: Utility = Utility()
    
    // Shak notes: Functions
    func addSATToHighSchool(_ HS: [HighSchool]?) {
        guard let hS = HS else { return }
        for item in hS {
            if let matchedId = item.dbn {
                var machedHighSchoolWithSAT = self.schoolArray?.first(where: { (highSchools) -> Bool in
                    return highSchools.dbn == matchedId
                })
                if machedHighSchoolWithSAT != nil {
                    if let numberOfTestTaker = item.num_of_sat_test_takers {
                        machedHighSchoolWithSAT?.num_of_sat_test_takers = numberOfTestTaker
                    }
                    if let satReadingScore = item.sat_critical_reading_avg_score {
                        machedHighSchoolWithSAT?.sat_critical_reading_avg_score = satReadingScore
                    }
                    if let satMathScore = item.sat_math_avg_score {
                        machedHighSchoolWithSAT?.sat_math_avg_score = satMathScore
                    }
                    if let satWritingScore = item.sat_writing_avg_score {
                        machedHighSchoolWithSAT?.sat_writing_avg_score = satWritingScore
                    }
                }
            }
        }
    }
    
    func convertToArrayOfDictionary(_ highSchoolData: Any) -> [HighSchool]? {
        guard let HSData = highSchoolData as? [[String : Any]] else { return nil }
        var schoolModelArray = [HighSchool]()
        for item in HSData {
            if let highSchools = getVariables(item) {
                schoolModelArray.append(highSchools)
            }
        }
        return schoolModelArray
    }
    
    func getVariables(_ json: [String : Any]) -> HighSchool? {
        let highSchools = HighSchool()
        if !json.isEmpty {
            if let dbnObject = json["dbn"] as? String{
                highSchools.dbn = dbnObject
            }
            if let school_nameObject = json["school_name"] as? String {
                highSchools.school_name = school_nameObject
            }
            return highSchools
        }
        return nil
    }
    
}









