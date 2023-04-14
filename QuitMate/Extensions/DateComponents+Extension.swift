//
//  DateComponents+Extension.swift
//  QuitMate
//
//  Created by Саша Василенко on 14.04.2023.
//

import Foundation

extension DateComponents {
    func toSting() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        
        return formatter.string(for: self)!
    }
}
