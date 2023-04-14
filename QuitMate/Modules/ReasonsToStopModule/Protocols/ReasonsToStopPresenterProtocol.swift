//
//  ReasonsToStopPresenterProtocol.swift
//  QuitMate
//
//  Created by Саша Василенко on 20.03.2023.
//

import Foundation

protocol ReasonsToStopPresenterProtocol: AnyObject {
    func showArrayOfReasons()
    func didTapDoneButton(reasons: [String])
}
