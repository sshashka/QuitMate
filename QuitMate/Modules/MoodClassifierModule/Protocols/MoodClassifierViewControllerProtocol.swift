//
//  DetectingMoodViewControllerProtocol.swift
//  QuitMate
//
//  Created by Саша Василенко on 16.04.2023.
//

import Foundation

protocol MoodClassifierViewControllerProtocol: AnyObject {
    func showValidationFailureAlert(message: String)
    func classifierServiceSentSuccess()
}
