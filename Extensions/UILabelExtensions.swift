//
//  UILabelExtensions.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.02.2023.
//

import UIKit

extension UILabel {
    // Makes font which is being used around a project
    func setHelveticaBoldFont(size: CGFloat) {
        let font = UIFont(name: "HelveticaNeue-Bold", size: size)
        self.font = font
    }
}
