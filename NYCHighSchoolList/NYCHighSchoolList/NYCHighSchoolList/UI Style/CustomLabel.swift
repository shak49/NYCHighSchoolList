//
//  CustomLabel.swift
//  NYCHighSchoolList
//
//  Created by Shak Feizi on 8/18/21.
//

import UIKit

class CustomLabel: UILabel {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCustomLabel()
    }
    func setupCustomLabel() {
        self.addCornerRadius()
        backgroundColor = UIColor.systemGray5
    }
}
