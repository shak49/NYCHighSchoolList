//
//  HighSchool + Convenience.swift
//  HighSchoolList_Demo
//
//  Created by Shak Feizi on 8/9/21.
//

import UIKit
import CoreData


extension Selection {
    @discardableResult convenience init(name: String?, satTestTaker: String?, id: String? = UUID().uuidString, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.satTestTaker = satTestTaker
        self.id = id
    }
}
