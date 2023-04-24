//
//  UIButtonExtensions.swift
//  QuitMate
//
//  Created by Саша Василенко on 15.02.2023.
//

import UIKit

extension UIButton {
    override open var isEnabled: Bool {
        didSet {
            if self.isEnabled {
                self.alpha = 1.0
            }
            else {
                self.alpha = 0.5
            }
            //make sure button is updated
            self.layoutIfNeeded()
        }
    }
}
