//
//  UILabelExtensions.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.02.2023.
//

import UIKit

extension UILabel {
    enum PoppinsFontStyles: String {
        case bold = "-Bold"
        case medium = "-Medium"
    }
    // Makes font which is being used around a project
    func setPoppinsFont(size: CGFloat, style: PoppinsFontStyles = .medium) {
        let font = UIFont(name: "Poppins\(style)", size: size)
        self.font = font
    }
}
