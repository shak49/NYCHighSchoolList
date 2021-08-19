//
//  CustomButton.swift
//  NYCHighSchoolList
//
//  Created by Shak Feizi on 8/17/21.
//

import UIKit

class CustomButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCustomButton()
    }
    
    func setupCustomButton() {
        self.addCornerRadius()
    }
}
